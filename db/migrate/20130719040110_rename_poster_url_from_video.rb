class RenamePosterUrlFromVideo < ActiveRecord::Migration
  def change
  	rename_column :videos, :poster_url, :poster
  end
end
