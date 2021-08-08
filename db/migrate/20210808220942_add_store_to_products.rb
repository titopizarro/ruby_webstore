class AddStoreToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :store, null: false, foreign_key: true
  end
end