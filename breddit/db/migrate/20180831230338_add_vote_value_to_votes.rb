class AddVoteValueToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :votes, :vote_value, :integer
  end
end
