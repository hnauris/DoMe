class PostChangeUserToUserid < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :user
    add_column :posts, :user_id, :integer
  end
end
