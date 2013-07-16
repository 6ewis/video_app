class CartsController < ApplicationController
	def show
	begin
		@cart = Cart.find(params[:id])
	rescue ActiveRecord::RecordNotFound
		logger.error "Attempt to access invalid cart #{params[:id]}"
		redirect_to store_url, notice: 'Invalid cart'
	end
	end
end
