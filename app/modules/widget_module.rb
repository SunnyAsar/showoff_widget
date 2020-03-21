module Widgett
  require 'rest-client'
  require 'json'

  def self.get_widgets
    c_Id = ENV['CLIENT_ID']
    c_Secret = ENV['CLIENT_SECRET']
    token = session[:token]['access_token']
    url = "https://showoff-rails-react-production.herokuapp.com/api/v1/widgets/visible?client_id=#{c_Id}&client_secret=#{c_Secret}"
    


    response = RestClient::Request.execute(method: :get,
                            url: url,
                            headers: {"Content-Type" => "application/json", :Authorization => "Bearer #{session[:token]['access_token']}" }
                          )
                          return response
    end

    
end
