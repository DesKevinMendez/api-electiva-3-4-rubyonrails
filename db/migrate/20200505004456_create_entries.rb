class CreateEntries < ActiveRecord::Migration[6.0]
  def change
    create_table :entries do |t|
      t.string :id_document
      t.integer :warehouse_id
      t.integer :user_id
      t.date :date
      t.integer :origin_warehouse_id
      t.float :total

      t.timestamps
    end
  end
end
