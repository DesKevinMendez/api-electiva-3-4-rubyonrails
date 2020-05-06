class DepartureDetailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :departure_id, :product_id, :quantity, :price, :subtotal

  # Relations
  belongs_to :departure
  belongs_to :product

end
