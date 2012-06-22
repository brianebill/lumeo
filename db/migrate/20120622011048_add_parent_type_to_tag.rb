class AddParentTypeToTag < ActiveRecord::Migration
  def change
    add_column :tags, :parent_type, :string
  end
end
