class RemoveRequestIdFromTag < ActiveRecord::Migration
  def up
    remove_column :tags, :request_id
        remove_column :tags, :question_id
        remove_column :tags, :post_id
        remove_column :tags, :course_id
        remove_column :tags, :problem_id
        remove_column :tags, :idea_id
        remove_column :tags, :video_id
        remove_column :tags, :parent_id
        remove_column :tags, :parent_type
      end

  def down
    add_column :tags, :parent_type, :integer
    add_column :tags, :parent_id, :integer
    add_column :tags, :video_id, :integer
    add_column :tags, :idea_id, :integer
    add_column :tags, :problem_id, :integer
    add_column :tags, :course_id, :integer
    add_column :tags, :post_id, :integer
    add_column :tags, :question_id, :integer
    add_column :tags, :request_id, :integer
  end
end
