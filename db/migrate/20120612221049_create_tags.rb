class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :post_id
      t.integer :request_id
      t.integer :idea_id
      t.integer :problem_id
      t.integer :question_id
      t.integer :course_id
      t.integer :video_id

      t.timestamps
    end
  end
end
