class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize_user_only

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
        Video.current_user = @current_user  #for the model Video, to know if a video has been paid 
                                            # Also used in The Order model to add the user_id to the line_items
    end

    helper_method :current_user

    def total_price
      if session[:cart_id] 
         Cart.find(session[:cart_id]).total_price
    #order has a total_price column
      end
    end

    helper_method :total_price

    def authorize_user_only
        redirect_to login_url, alert:"Not authorized, please enter your login information" \
        if current_user.nil?
    end

    def authorize_admin_only
        if current_user.nil? || !current_user.admin
        redirect_to login_url, alert:"Not authorized, Please enter your admin information" 
        end
    end

    def authorize_admin_and_those_who_ordered
        @video = Video.find(params[:id])
        unless ( current_user && current_user.ordered_video(@video) ||  (current_user && current_user.admin))
        redirect_to login_url, alert:"Not authorized, Please enter your admin information" 
        end
    end

    

end
