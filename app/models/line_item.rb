class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :video_id, :user_id, :order_id, :quantity

  belongs_to :video
  belongs_to :cart
  belongs_to :order
  belongs_to :user

  def total_price           #the quantity is not useful right now but might be in future
  	quantity * video.price  #implementation
  end

end
