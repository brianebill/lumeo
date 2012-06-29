class RemoveMicropostIdFromComment < ActiveRecord::Migration
  def up
    remove_column :comments, :micropost_id
        remove_column :comments, :post_id
      end

  def down
    add_column :comments, :post_id, :integer
    add_column :comments, :micropost_id, :integer
  end
end
