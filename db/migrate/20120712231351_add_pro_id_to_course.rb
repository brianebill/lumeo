class AddProIdToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :pro_id, :integer
  end
end
