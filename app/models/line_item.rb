class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :video_id, :quantity

  belongs_to :video
  belongs_to :cart

  def total_price
  	quantity * video.price
  end
  
end
