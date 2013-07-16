class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :video_url
      t.string :poster_url
      t.decimal :price

      t.timestamps
    end
  end
end
