class AddParentIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :parent_id, :integer
    add_column :comments, :parent_type, :string
  end
end
