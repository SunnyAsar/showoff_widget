class WidgetController < ApplicationController
  before_action :authenticated?

  def index
    item = Widget.get_widgets
    @item = ENV['CLIENT_SECRET']
    @user = session[:user_data]
    @token = session[:token]['access_token']
    @u =  User.new(session[:user])
  end

  def show
  end
end
