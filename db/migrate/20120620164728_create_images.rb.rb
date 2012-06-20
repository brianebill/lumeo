class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :parent
      t.string :parent_type

      t.string :source_file_name
      t.string :source_content_type

      t.integer :source_file_size
      t.datetime :source_updated_at

      t.boolean :processing, :default => false
    end
  end
end
