class UsersController < ApplicationController
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

  def profile
    @auth = session[:token]["access_token"]
    response = User.get_my_widgets @auth
    @widgets = response['data']['widgets']
  end

  private

  

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :image_url)
  end
end
