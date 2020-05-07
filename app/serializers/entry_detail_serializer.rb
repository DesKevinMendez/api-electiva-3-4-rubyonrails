class EntryDetailSerializer
  include FastJsonapi::ObjectSerializer
  attributes :entrie_id, :product_id, :quantity, :price, :subtotal

  
  # Relations
  belongs_to :entrie
  belongs_to :product

end
