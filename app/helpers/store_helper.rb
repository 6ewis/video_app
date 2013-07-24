module StoreHelper
	def already_in_cart?(video)
		if cart = Cart.find_by_id(session[:cart_id])
			cart.line_items.find_by_video_id(video.id)
	    else
	    	nil
	    end
	end
end
