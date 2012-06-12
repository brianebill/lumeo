class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.integer :community_id
      t.integer :school_id

      t.timestamps
    end
  end
end
