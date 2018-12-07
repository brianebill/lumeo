class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.boolean :status

      t.timestamps
    end
  end
end
