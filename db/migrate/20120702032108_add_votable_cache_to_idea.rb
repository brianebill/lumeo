class AddVotableCacheToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :user_votes_total, :integer, :default => 0
  end
end
