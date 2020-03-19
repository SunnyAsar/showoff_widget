class UsersController < ApplicationController
  require 'rest-client'
  require 'json'

  def new
    redirect_to root_path if session[:token]
    @user = User.new
  end

  def create
    response = User.register(user_params)
    if response.code === 200
      store_user JSON.parse response
      redirect_to :root
    else
      flash[:alert] = 'something horrible has happened'
      render 'new'
    end
  end

  private

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

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :image_url)
    end
end
