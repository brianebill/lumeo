class AddProToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :pro, :string
    add_column :courses, :subtitle, :string
    add_column :courses, :released, :datetime
    add_column :courses, :available, :boolean
    add_column :courses, :producer, :string
    add_column :courses, :credits, :integer
  end
end
