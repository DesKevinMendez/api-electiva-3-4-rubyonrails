class CreateShelvesInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :shelves_inventories do |t|
      t.integer :shelf_id
      t.integer :inventorie_id
      t.integer :quantity

      t.timestamps
    end
  end
end
