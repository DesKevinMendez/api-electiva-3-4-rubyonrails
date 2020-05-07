class EntrieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id_document, :warehouse_id, :user_id, :date, :origin_warehouse_id, :total

  # Relations
  belongs_to :warehouse
  belongs_to :user
  
end
