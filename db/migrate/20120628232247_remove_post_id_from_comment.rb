class RemovePostIdFromComment < ActiveRecord::Migration
  def chang
    remove_column :comments, :post_id
        remove_column :comments, :micropost_id
      end

  def down
    add_column :comments, :micropost_id, :integer
    add_column :comments, :post_id, :integer
  end
end
