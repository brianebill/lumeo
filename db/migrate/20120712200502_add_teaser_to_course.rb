class AddTeaserToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :teaser, :text
  end
end
