class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :index_text
      t.text :show_text
      t.datetime :created_date
      t.datetime :edited_date
      t.integer :category_id

      t.timestamps
    end
    add_index :posts, :title
    add_index :posts, :index_text
    add_index :posts, :show_text
    add_index :posts, :category_id
    add_index :posts, :created_date
    add_index :posts, :edited_date
  end
end
