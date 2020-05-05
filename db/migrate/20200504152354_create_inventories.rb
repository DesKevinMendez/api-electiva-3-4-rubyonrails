class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.integer :quantity
      t.integer :product_id
      t.integer :warehouse_id

      t.timestamps
    end
  end
end
