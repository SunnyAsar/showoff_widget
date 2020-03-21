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

  def create
    @auth = session[:token]["access_token"]
    widget = {"widget" => { :name => widget_params[:name], :description => widget_params[:description], :kind => widget_params[:kind] } }
    response = Widget.create_widget(widget,@auth)
    if response == 200
      redirect_to mywidgets_path
    else
      flash[:alert] = "something horrible happened"
      render 'users/profile'
    end
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

  def widget_params
    params.require(:widget).permit(:name, :description, :kind)
  end
end
