class CommentSerializer
  
  include FastJsonapi::ObjectSerializer
  attributes :comment, :blog_id
  
  belongs_to :blog
  
end
