class WarehouseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :address, :phone
end
