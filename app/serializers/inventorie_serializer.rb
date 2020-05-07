class InventorieSerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :product_id, :quantity, :warehouse_id
  
  # Relations
  belongs_to :warehouse
  belongs_to :product
  
  
end
