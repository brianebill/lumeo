class RemovePhotoColumnsFromCategory < ActiveRecord::Migration
  def up
    remove_column :categories, :photo_file_name
        remove_column :categories, :photo_content_type
        remove_column :categories, :photo_file_size
        remove_column :categories, :photo_updated_at
        remove_column :courses, :photo_file_name
            remove_column :courses, :photo_content_type
            remove_column :courses, :photo_file_size
            remove_column :courses, :photo_updated_at
            
            remove_column :posts, :photo_file_name
            remove_column :posts, :photo_content_type
            remove_column :posts, :photo_file_size
            remove_column :posts, :photo_updated_at
            
            remove_column :users, :photo_file_name
            remove_column :users, :photo_content_type
            remove_column :users, :photo_file_size
            remove_column :users, :photo_updated_at
      end

  def down
    add_column :categories, :photo_updated_at, :datetime
    add_column :categories, :photo_file_size, :integer
    add_column :categories, :photo_content_type, :string
    add_column :categories, :photo_file_name, :string
    add_column :courses, :photo_updated_at, :datetime
    add_column :courses, :photo_file_size, :integer
    add_column :courses, :photo_content_type, :string
    add_column :courses, :photo_file_name, :string
    add_column :posts, :photo_updated_at, :datetime
    add_column :posts, :photo_file_size, :integer
    add_column :posts, :photo_content_type, :string
    add_column :posts, :photo_file_name, :string
    
    add_column :users, :photo_updated_at, :datetime
    add_column :users, :photo_file_size, :integer
    add_column :users, :photo_content_type, :string
    add_column :users, :photo_file_name, :string
  end
end
