class AddVotableCacheToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :user_votes_total, :integer
  end
end
