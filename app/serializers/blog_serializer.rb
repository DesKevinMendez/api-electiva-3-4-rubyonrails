class BlogSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :title
  
  has_many :comments
  
end
