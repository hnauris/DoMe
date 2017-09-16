class PostUserStringToInteger < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :user
    add_column :posts, :user, :integer
  end
end
