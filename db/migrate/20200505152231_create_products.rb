class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :product_code
      t.integer :product_type_id
      t.integer :brand_id
      t.integer :provider_id
      t.integer :model_id

      t.timestamps
    end
  end
end
