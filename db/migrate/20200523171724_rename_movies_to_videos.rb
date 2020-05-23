class RenameMoviesToVideos < ActiveRecord::Migration[6.0]
  def change
    rename_table :movies, :videos
  end
end
