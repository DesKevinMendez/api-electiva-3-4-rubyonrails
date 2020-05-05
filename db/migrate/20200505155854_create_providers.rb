class CreateProviders < ActiveRecord::Migration[6.0]
  def change
    create_table :providers do |t|
      t.string :name
      t.string :address
      t.string :email, null: false, default: ""

      t.timestamps
    end
  end
end
