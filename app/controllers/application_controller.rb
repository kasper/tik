class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :currently_logged_in?

  def current_user

    unless session[:user_id].nil?

      User.find(session[:user_id])

    end

  end

  def logged_in?

     !current_user.nil?

  end

  def currently_logged_in?(user)

    current_user == user

  end

  def ensure_that_logged_in

    redirect_to login_path, :notice => 'You should be logged in.' unless logged_in?

  end

  def ensure_that_not_logged_in

    redirect_to :root if logged_in?

  end

  def ensure_that_admin

    render :status => :forbidden, :text => 'Forbidden.' unless current_user.admin?

  end

end
