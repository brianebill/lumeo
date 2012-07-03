class CreateIdeasTags < ActiveRecord::Migration
   def up
    create_table :ideas_tags, :id => false do |t|
    t.integer :idea_id
    t.integer :tag_id
   end
   add_index :ideas_tags, [:idea_id, :tag_id]
   add_index :ideas_tags, [:tag_id, :idea_id]
  end

  def down
   drop_table :ideas_tags
  end
end
