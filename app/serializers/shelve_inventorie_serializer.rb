class ShelveInventorieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :shelf_id, :inventorie_id, :quantity
  
  # Relations
  belongs_to :shelf
  belongs_to :inventorie

end
