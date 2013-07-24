class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation, :admin
  validates :name, presence: true, uniqueness: true

  has_secure_password
  has_many :line_items, dependent: :destroy

  def ordered_video(video)
  	line_items.find_by_video_id(video.id)
  end
end
