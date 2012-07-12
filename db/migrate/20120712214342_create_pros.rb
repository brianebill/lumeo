class CreatePros < ActiveRecord::Migration
  def change
    create_table :pros do |t|
      t.integer :user_id
      t.text :description
      t.text :teaser
      t.string :location

      t.timestamps
    end
  end
end
