class AuthenticationController < ApplicationController
  before_action :authenticated?, except: [:login]

  def login
    puts login_params
    response = User.login(login_params)
    if response.code === 200
      store_token JSON.parse response
      redirect_to root_path
    else
      flash[:alert] = 'something horrible has happened'
      render 'new'
    end
  end

  def logout
    session.delete :token
    session.delete :user
    redirect_to public_path
  end

  private

  def login_params
    params.require(:user).permit(:email,:password, :grant_type)
  end
  def store_token data
    session[:token] = data['data']['token']
  end

end
