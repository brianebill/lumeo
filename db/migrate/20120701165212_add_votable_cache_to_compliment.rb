class AddVotableCacheToCompliment < ActiveRecord::Migration
  def change
    add_column :compliments, :user_votes_total, :integer, :default => 0
  end
end
