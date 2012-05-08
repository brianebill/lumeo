class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
    add_index :schools, :name
    add_index :schools, :description
  end
end
