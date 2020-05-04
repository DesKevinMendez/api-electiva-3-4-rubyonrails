class CreateJoinTableUsersWarehouses < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :warehouses do |t|
      t.index [:user_id, :warehouse_id]
      t.index [:warehouse_id, :user_id]
    end
  end
end
