class OrdersController < ApplicationController
  
  def new
      if session[:cart_id]
  	    @cart = Cart.find_by_id(session[:cart_id])
  	      if @cart.line_items.empty?
  		      redirect_to store_url, notice: "Your cart is empty"
          end
        @order = Order.new
      else  
      redirect_to store_url, notice: "An error occured" 
  	end
  	    
  end

  def create
    @order = Order.new(params[:order])
  	@order.add_line_items_with_user_id_from_cart(current_cart)
    @order.ip_address = request.remote_ip
    @order.total_price = total_price
  	if @order.save
  		Cart.destroy(session[:cart_id])
  		session[:cart_id] = nil
  		OrderNotifier.received(@order).deliver
  		redirect_to store_url, notice: "Thank you for your order. A confirmation email was sent to #{@order.email}"
  	else
      @cart = current_cart
  		render :new, alert: "Your order was not successfull"

    end
  end

    def index
      @orders = Order.order(:created_at)
    end

    def destroy
      order = Order.find(params[:id])
      order.destroy

      redirect_to order_url, notice: "As per your request an order has just been destroyed"
    end
end
