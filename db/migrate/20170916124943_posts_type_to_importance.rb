class PostsTypeToImportance < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :type, :importance
  end
end
