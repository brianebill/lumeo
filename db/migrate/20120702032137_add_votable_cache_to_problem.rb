class AddVotableCacheToProblem < ActiveRecord::Migration
  def change
    add_column :problems, :user_votes_total, :integer, :default => 0
  end
end
