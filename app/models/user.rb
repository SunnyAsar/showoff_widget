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


                          response
  end


  def self.login user
    url = 'https://showoff-rails-react-production.herokuapp.com/oauth/token'
    c_Id = ENV['CLIENT_ID']
    c_Secret = ENV['CLIENT_SECRET']


    data = { client_id: c_Id, client_secret: c_Secret, username: user[:email], password: user[:password], grant_type: 'password' }.to_json

    response = RestClient::Request.execute(method: :post,
                            url: url,
                            payload: data,
                            headers: {"Content-Type" => "application/json"}
                           )


                        response

  end

  def self.get_my_widgets token
    c_Id = ENV['CLIENT_ID']
    c_Secret = ENV['CLIENT_SECRET']
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/users/me/widgets?client_id=#{c_Id}&client_secret=#{c_Secret}"
    response = RestClient::Request.execute(method: :get,
                                url: url,
                                headers: {"Content-Type" => "application/json",
                                :Authorization => "Bearer #{token}" }
                                 )
                                JSON.parse response
  end

end
