class CreateJoinTableUsersWarehauses < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :warehauses do |t|
      t.index [:user_id, :warehause_id]
      t.index [:warehause_id, :user_id]
    end
  end
end
