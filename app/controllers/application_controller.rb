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
        Video.current_user = @current_user
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

    def authorize_buyer
        @video = Video.find(params[:id])
        unless ( current_user && current_user.ordered_video(@video) ||  (current_user && current_user.admin))
        redirect_to login_url, alert:"Not authorized, Please enter your admin information" 
        end
    end

    

end
