class DepartureSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :id_document, :user_id, :warehouse_id, :date, :destination_warehouse_id, :total

  # Relations
  belongs_to :warehouse
  belongs_to :user
  
end
