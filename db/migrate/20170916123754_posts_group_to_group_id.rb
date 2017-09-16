class PostsGroupToGroupId < ActiveRecord::Migration[5.1]
  def change
    remove_column :posts, :group
    add_column :posts, :group_id, :integer
  end
end
