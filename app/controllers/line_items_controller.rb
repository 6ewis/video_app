class LineItemsController < ApplicationController
  def create

  	
  	video = Video.find(params[:format])
  	@line_item = current_cart.add_video(video)
  	
  
  	if @line_item.save
  		redirect_to @line_item.cart, notice: "Line item was successfully created"
  	else
  		redirect_to store_url, notice: "an error has occured"
    end

  end

end
