class User < ApplicationRecord
  require 'rest-client'
  require 'json'

  def self.register user

    url = 'https://showoff-rails-react-production.herokuapp.com/api/v1/users'
    c_Id = ENV['CLIENT_ID']
    c_Secret = ENV['CLIENT_SECRET']


    data = {client_id: c_Id, client_secret: c_Secret, user: user }.to_json
    response = RestClient::Request.execute(method: :post,
                            url: url,
                            payload: data,
                            headers: {"Content-Type" => "application/json"}
                           )
                          #  puts Object.new(response.body.to)


                          response
  end

end
