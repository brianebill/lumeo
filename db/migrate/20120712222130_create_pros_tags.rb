class CreateProsTags < ActiveRecord::Migration
   def up
    create_table :pros_tags, :id => false do |t|
    t.integer :pro_id
    t.integer :tag_id
   end
   add_index :pros_tags, [:pro_id, :tag_id]
   add_index :pros_tags, [:tag_id, :pro_id]
  end

  def down
   drop_table :pros_tags
  end
end
