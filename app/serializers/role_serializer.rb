class RoleSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :slug
end
