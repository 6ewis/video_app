class SessionsController < ApplicationController
  skip_before_filter :authorize_user_only

  def new
  end

  def create
  	user = User.find_by_name(params[:name])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
      session[:cart_id] = nil
  		user.admin ? (redirect_to videos_url) : (redirect_to store_url)
  	else
  	  redirect_to login_url, alert: "Name or password is invalid" 
  	end

  end

  def destroy
  	session[:user_id] = nil
    session[:cart_id] = nil
  	redirect_to store_url, notice: "Logged out"
  end
end
