class ModelSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name
end
