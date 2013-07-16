class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :video_id

  belongs_to :video
  belongs_to :cart
end
