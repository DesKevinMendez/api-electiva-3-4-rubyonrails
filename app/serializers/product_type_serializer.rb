class ProductTypeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
