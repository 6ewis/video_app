class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize_user

  private

    def current_cart
    	Cart.find(session[:cart_id])
        rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id 
        cart
    end

    def current_user
    	@current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    helper_method :current_user

    def authorize_user
        redirect_to login_url, alert:"Not authorized, please enter your login information" \
        if current_user.nil?
    end

    def authorize_admin
        if current_user.nil? || !current_user.admin
        redirect_to login_url, alert:"Not authorized, Please enter your admin information" 
        end
    end

    

end
