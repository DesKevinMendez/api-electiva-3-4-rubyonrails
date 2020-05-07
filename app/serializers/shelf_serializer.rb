class ShelfSerializer
  include FastJsonapi::ObjectSerializer
  attributes :hall, :shelving, :floor, :warehouse_id
  
  # Relations
  belongs_to :warehouse
  
end
