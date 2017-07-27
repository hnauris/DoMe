class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :date
      t.text :description
      t.integer :type
      t.timestamps
    end
  end
end
