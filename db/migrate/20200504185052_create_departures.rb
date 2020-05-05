class CreateDepartures < ActiveRecord::Migration[6.0]
  def change
    create_table :departures do |t|
      t.string :id_document
      t.integer :user_id
      t.integer :warehouse_id
      t.date :date
      t.integer :destination_warehouse_id, default: ""
      t.float :total

      t.timestamps
    end
  end
end
