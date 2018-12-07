class CreateCoursesTags < ActiveRecord::Migration
   def up
    create_table :courses_tags, :id => false do |t|
    t.integer :course_id
    t.integer :tag_id
   end
   add_index :courses_tags, [:course_id, :tag_id]
   add_index :courses_tags, [:tag_id, :course_id]
  end

  def down
   drop_table :courses_tags
  end
end
