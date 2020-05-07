class BlogSerializer
  include FastJsonapi::ObjectSerializer
  attributes :content, :title
end
