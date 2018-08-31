class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string 'title'
      t.text 'description'
      t.integer 'vote_value'
      t.string 'user_id'

      t.timestamps
    end
  end
end
