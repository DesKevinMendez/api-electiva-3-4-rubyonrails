class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :email, 
    :username, :password, :status, :role_id

  belongs_to :role
  has_many :warehouse
  
end
