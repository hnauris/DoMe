class AddMembersColToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :member_list, :string, array: true, default: '{}'
  end
end
