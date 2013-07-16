class Cart < ActiveRecord::Base

has_many :line_items, dependent: :destroy

	def add_video(video_id)
		current_item = line_items.find_by_video_id(video_id)
		if current_item
			current_item.quantity +=1
		else
			current_item = line_items.build(video_id: video_id)
		end
		current_item
	end

end
