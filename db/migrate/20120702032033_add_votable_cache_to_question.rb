class AddVotableCacheToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :user_votes_total, :integer, :default => 0
  end
end
