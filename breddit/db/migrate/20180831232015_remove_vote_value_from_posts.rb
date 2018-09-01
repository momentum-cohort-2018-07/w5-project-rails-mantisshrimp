class RemoveVoteValueFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :vote_value, :integer
  end
end
