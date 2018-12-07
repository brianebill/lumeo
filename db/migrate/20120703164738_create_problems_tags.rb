class CreateProblemsTags < ActiveRecord::Migration
   def up
    create_table :problems_tags, :id => false do |t|
    t.integer :problem_id
    t.integer :tag_id
   end
   add_index :problems_tags, [:problem_id, :tag_id]
   add_index :problems_tags, [:tag_id, :problem_id]
  end

  def down
   drop_table :problems_tags
  end
end
