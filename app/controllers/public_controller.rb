class PublicController < ApplicationController
  def index
    redirect_to root_path if session[:token]
  end
end
