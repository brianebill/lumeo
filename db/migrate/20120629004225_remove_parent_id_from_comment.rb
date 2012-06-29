class RemoveParentIdFromComment < ActiveRecord::Migration
  def up
    remove_column :comments, :parent_id
        remove_column :comments, :parent_type
      end

  def down
    add_column :comments, :parent_type, :string
    add_column :comments, :parent_id, :integer
  end
end
