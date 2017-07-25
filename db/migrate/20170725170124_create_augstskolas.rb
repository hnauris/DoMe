class CreateAugstskolas < ActiveRecord::Migration[5.1]
  def change
    create_table :augstskolas do |t|
      t.string :name
      t.string :symbol
      t.string :city
      t.timestamps
    end
  end
end
