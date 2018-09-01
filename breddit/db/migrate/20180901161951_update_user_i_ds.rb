class UpdateUserIDs < ActiveRecord::Migration[5.2]
  def change
    change_column :comments, :user_id, 'integer USING CAST(user_id AS integer)'
    change_column :posts, :user_id, 'integer USING CAST(user_id AS integer)'
    add_column :votes, :user_id, :integer
  end
end
