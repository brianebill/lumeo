class CategoriesPosts < ActiveRecord::Migration
   def up
    create_table :categories_posts, :id => false do |t|
    t.references :category
    t.references :post
   end
   add_index :categories_posts, [:post_id, :category_id]
   add_index :categories_posts, [:category_id, :post_id]
  end

  def down
   drop_table :categories_posts
   end
  end
