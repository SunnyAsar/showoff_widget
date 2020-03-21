class Widget < ApplicationRecord
  require 'rest-client'
  require 'json'

  def self.get_widgets(token)
    c_id = ENV['CLIENT_ID']
    c_secret = ENV['CLIENT_SECRET']
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?client_id=#{c_id}&client_secret=#{c_secret}"

    response = RestClient::Request.execute(method: :get,
                            url: url,
                            headers: {"Content-Type" => "application/json",
                             :Authorization => "Bearer #{token}" }
                                          )
     JSON.parse response
  end

  def self.search(term, token)
    c_id = ENV['CLIENT_ID']
    c_secret = ENV['CLIENT_SECRET']
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?client_id=#{c_id}&client_secret=#{c_secret}&term=#{term}"

    response = RestClient::Request.execute(method: :get,
                                url: url,
                                headers: {"Content-Type" => "application/json",
                                :Authorization => "Bearer #{token}" }
                                 )
                                JSON.parse response
  end

  def self.create_widget(data,token)
    url = 'https://showoff-rails-react-production.herokuapp.com/api/v1/widgets'
    c_Id = ENV['CLIENT_ID']
    c_Secret = ENV['CLIENT_SECRET']

    # data = {client_id: c_Id, client_secret: c_Secret, user: user }.to_json
    puts data
    response = RestClient::Request.execute(method: :post,
                            url: url,
                            payload: data,
                            headers: {
                              "Content-Type" => "application/json",
                              :Authorization => "Bearer #{token}" }
                           )


                        JSON.parse response
  end
end
