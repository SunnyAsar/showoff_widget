module ApplicationHelper
  def authenticated?
    redirect_to new_user_path unless session[:token]
  end

end
