class LineItemsController < ApplicationController
  def create

  	@cart = current_cart
  	video = Video.find(params[:format])
  	@line_item = @cart.add_video(video.id)
  	

  	if @line_item.save
  		redirect_to @line_item.cart, notice: "Line item was successfully created"
  	else
  		render redirect_to store_path
    end

  end

end
