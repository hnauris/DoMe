class RenameOwnerToUserInPosts < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :owner, :user
    add_column :posts, :group, :string
  end
end
