class CreateCategorizations < ActiveRecord::Migration
  def change
    create_table :categorizations do |t|
      t.integer :post_id
      t.integer :category_id
      t.integer :postion

      t.timestamps
    end
  end
end
