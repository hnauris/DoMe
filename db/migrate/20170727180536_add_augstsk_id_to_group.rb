class AddAugstskIdToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :augstskola_id, :integer
  end
end
