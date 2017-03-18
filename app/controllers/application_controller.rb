class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # These are available to all controllers, but not to views
  # Specify as helper methods to do so
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # !! converts the return to boolean
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to root_path
    end
  end

end
