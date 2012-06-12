class CreateTopicRequests < ActiveRecord::Migration
  def change
    create_table :topic_requests do |t|
      t.integer :topic_id
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
