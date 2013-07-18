class Video < ActiveRecord::Base
  attr_accessible :description, :poster_url, :price, :title, :video

  mount_uploader :video, VideoUploader

  validates :price, :title, :video_url, presence: true

  validates :price, numericality:{greater_than_or_equal_to: 0.01, message: "must be a positive number",
                                allow_nil: false}
  validates :title, uniqueness: true

  validates :video, format: {with: /\.(mp4|ogv|ogg|webm)\Z/i,
                               message: 'must be a URL for mp4. ogg or webm video'}

  validates :poster_url,  format: {with: /\.(gif|jpg|png)\Z/i,
                        message: 'must be a URL for GIF, JPG or PNG image',
                        allow_blank: true}

  has_many :line_items
  
   before_destroy :ensure_not_referenced_by_any_line_item

  private

    def ensure_not_referenced_by_any_line_item
    	line_items.empty?.tap { |i| errors.add(:base, "Line Items prsent") unless i}
    end                      
end
