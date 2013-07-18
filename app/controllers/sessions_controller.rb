class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by_name(params[:name])
  	if user && user.authenticate(params[:password])
  		session[:user_id] = user.id
  		redirect_to store_url
  	else
  	  redirect_to login_url, alert: "Email or password is invalid" 
  	end

  end

  def destroy
  	session[:user_id] = nil
    session[:cart_id] = nil
  	redirect_to store_url, notice: "Logged out"
  end
end