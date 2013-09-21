class SessionsController < ApplicationController

  def create

    user = User.find_by_username(params[:username])

    if user.nil? or not user.authenticate(params[:password])

      redirect_to(:back, :notice => 'Username or password do not match.')

    else

      session[:user_id] = user.id

      redirect_to(:root)

    end

  end

  def destroy

    session[:user_id] = nil

    redirect_to(:root)

  end

end
