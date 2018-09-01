class AddAssociationIds < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :post_id, :integer
    add_column :votes, :post_id, :integer
  end
end
