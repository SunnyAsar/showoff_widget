class WidgetsController < ApplicationController
  before_action :authenticated?

  def index
    @item = ENV['CLIENT_SECRET']
    @user = session[:user]
    @auth = session[:token]["access_token"]


    response = Widget.get_widgets @auth
     @widgets =  response['data']['widgets']
  end

  def show
  end
end
