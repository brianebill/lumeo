class CreateCompliments < ActiveRecord::Migration
  def change
    create_table :compliments do |t|
      t.integer :user_id
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
