class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :school_id
      t.string :title
      t.time :total_running_time
      t.text :show_text
      t.text :index_text

      t.timestamps
    end
    add_index :courses, :title
    add_index :courses, :show_text
    add_index :courses, :index_text
  end
end
