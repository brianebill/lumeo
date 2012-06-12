class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :who

      t.timestamps
    end
  end
end
