class StoreController < ApplicationController
  def index
  	@videos = Video.order(:title)
  end
end
