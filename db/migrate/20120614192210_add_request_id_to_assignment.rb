class AddRequestIdToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :request_id, :integer
    add_column :assignments, :tag_id, :integer
  end
end
