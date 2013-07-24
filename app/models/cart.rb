class Cart < ActiveRecord::Base

has_many :line_items, dependent: :destroy

	def add_video(video)
		current_item = line_items.find_by_video_id(video.id)
		if current_item
			#current_item.quantity +=1 not very useful for now but could be in future implementation of the app
		    # dont need to purchase the same video many times
		     current_item.quantity = 1
		else
			current_item = line_items.build(video_id: video.id)
		end
		current_item
	end

	def total_price
		line_items.map(&:total_price).inject(0, :+)
	end


end
