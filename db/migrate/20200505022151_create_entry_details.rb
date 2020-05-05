class CreateEntryDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :entry_details do |t|
      t.integer :entrie_id
      t.integer :product_id
      t.integer :quantity
      t.float :price
      t.float :subtotal

      t.timestamps
    end
  end
end
