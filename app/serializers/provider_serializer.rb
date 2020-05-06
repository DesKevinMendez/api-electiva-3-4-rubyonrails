class ProviderSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :address, :email
end
