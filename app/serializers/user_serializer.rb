class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :username
end
