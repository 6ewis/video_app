class LineItemsController < ApplicationController
  def create

  	@cart = current_cart
  	@line_item = @cart.line_items.build
  	@line_item.video = Video.find(params[:format])

  	if @line_item.save
  		redirect_to @line_item.cart, notice: "Line item was successfully created"
  	else
  		render redirect_to store_path
    end

  end

end
