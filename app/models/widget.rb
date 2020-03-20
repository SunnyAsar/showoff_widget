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
end
