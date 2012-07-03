class CreateReqestsTags < ActiveRecord::Migration
   def up
    create_table :requests_tags, :id => false do |t|
    t.integer :request_id
    t.integer :tag_id
   end
   add_index :requests_tags, [:request_id, :tag_id]
   add_index :requests_tags, [:tag_id, :request_id]
  end

  def down
   drop_table :requests_tags
   end
  end
