class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :color
      t.string :size
      t.integer :price
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
