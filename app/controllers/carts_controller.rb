class CartsController < ApplicationController
	def show
	begin
		@cart = Cart.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		logger.error "Attempt to access invalid cart #{params[:id]}"
		redirect_to store_url, alert: 'Invalid cart'
	end
	end

	def destroy
		Cart.destroy(params[:id]) 
		session[:cart_id] = nil
		redirect_to store_url, notice: "The cart is now empty"
	end
end
