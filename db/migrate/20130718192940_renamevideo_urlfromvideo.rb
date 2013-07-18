class RenamevideoUrlfromvideo < ActiveRecord::Migration
  def change
  	rename_column :videos, :video_url, :video
  end
end
