class CreateShelves < ActiveRecord::Migration[6.0]
  def change
    create_table :shelves do |t|
      t.string :hall
      t.string :shelving
      t.string :floor
      t.integer :warehouse_id

      t.timestamps
    end
  end
end
