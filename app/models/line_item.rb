class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :video_id, :user_id, :order_id, :quantity

  belongs_to :video
  belongs_to :cart
  belongs_to :order
  belongs_to :user

  def total_price
  	quantity * video.price
  end

end
