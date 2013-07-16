class Video < ActiveRecord::Base
  attr_accessible :description, :poster_url, :price, :title, :video_url
end
