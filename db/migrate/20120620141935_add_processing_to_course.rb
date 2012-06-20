class AddProcessingToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :processing, :boolean
  end
end
