class CreateKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :keywords do |t|
      t.string :name
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
