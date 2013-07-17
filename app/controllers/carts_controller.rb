class CartsController < ApplicationController
	def show
	begin
		@cart = Cart.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		logger.error "Attempt to access invalid cart #{params[:id]}"
		redirect_to store_url, notice: 'Invalid cart'
	end
	end

	def destroy
		@cart = current_cart
		@cart.destroy
		session[:cart_id] = nil
		redirect_to store_url
	end
end
