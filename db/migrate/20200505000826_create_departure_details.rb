class CreateDepartureDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :departure_details do |t|
      t.integer :departure_id
      t.integer :product_id
      t.integer :quantity
      t.float :price
      t.float :subtotal

      t.timestamps
    end
  end
end
