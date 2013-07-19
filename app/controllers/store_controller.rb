class StoreController < ApplicationController
  skip_before_filter :authorize_user

  def index
  	@videos = Video.order(:title)
  end
end
