class OrdersController < ApplicationController
  def new
  	@cart = current_cart
  	if @cart.line_items.empty?
  		redirect_to store_url, notice: "Your cart is empty"
  	else
  	    @order = Order.new
  	end
  end

  def create
  	@order = Order.new(params[:order])
  	@order.add_line_items_from_cart(current_cart)
    @line_item = LineItem.find_by_cart_id(session[:cart_id])

  	if @order.save
      @line_item.update_attributes(order_id: @order.id, user_id: session[:user_id])
  		Cart.destroy(session[:cart_id])
  		session[:cart_id] = nil
  		OrderNotifier.received(@order).deliver
  		redirect_to store_url, notice: "Thank you for your order. A confirmation email was sent to #{@order.email}"
  	else
  		render :new

    end
  end

    def index
      @orders = Order.order(:created_at)
    end

    def destroy
      @oder = Order.find(params[:id])
      @order.destroy

      redirect_to order_url, notice: "As per your request an order has just been destroyed"
    end
end
