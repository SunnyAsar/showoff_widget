class ApplicationController < ActionController::Base
  require 'json'

  def authenticated?
    redirect_to new_user_path unless session[:token]
  end

  def store_user data
    user = data['data']['user']
    user_data = {
      name: user['name'],
      first_name: user['first_name'],
      last_name: user['last_name'],
      email: user['email'],
    }
    session[:token] =  data['data']['token']
    session[:user] = user_data
 
  end
end
