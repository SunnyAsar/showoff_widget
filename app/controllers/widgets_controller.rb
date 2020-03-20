class WidgetsController < ApplicationController
  before_action :authenticated?

  def index
    @item = ENV['CLIENT_SECRET']
    @user = session[:user]
    @auth = session[:token]["access_token"]
     if params[:search]
      find_widget
     else
      response = Widget.get_widgets @auth
      @widgets = response['data']['widgets']
     end
  end

  def show
  end

  private

  def find_widget
    term = search_params[:search_term]
    if term
      response = Widget.search(term, @auth)
      @widgets = response['data']['widgets']
    end
  end

  def search_params
    params.require(:search).permit(:search_term)
  end
end
