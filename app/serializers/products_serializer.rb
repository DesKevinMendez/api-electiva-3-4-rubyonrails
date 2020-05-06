class ProductsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :product_code, :product_type_id, :brand_id, :provider_id, :model_id
  
  # Relations
  belongs_to :brand
  belongs_to :model
  belongs_to :product_type
  belongs_to :provider


end
