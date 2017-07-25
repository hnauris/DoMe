class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.string :admin
      t.string :name
      t.timestamps
    end
  end
end
