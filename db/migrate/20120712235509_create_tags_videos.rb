class CreateTagsVideos < ActiveRecord::Migration
   def up
    create_table :tags_videos, :id => false do |t|
    t.integer :video_id
    t.integer :tag_id
   end
   add_index :tags_videos, [:video_id, :tag_id]
   add_index :tags_videos, [:tag_id, :video_id]
  end

  def down
   drop_table :tags_videos
  end
end
