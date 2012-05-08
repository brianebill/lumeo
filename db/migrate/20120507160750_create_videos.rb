class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.integer :course_id
      t.text :html_embed_for_video
      t.time :running_time
      t.integer :user_id

      t.timestamps
    end
     add_index :videos, :title
     add_index :videos, :description
  end
end
