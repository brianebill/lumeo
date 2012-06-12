class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.string :title
      t.text :message
      t.boolean :status

      t.timestamps
    end
  end
end
