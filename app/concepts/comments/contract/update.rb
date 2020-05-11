module Comment::Contract
  class Update < Reform::Form
    property :comment
    property :blog_id
          
    validation do
      params do
        required(:comment).filled
        required(:blog_id).filled
      end
    end

  end
end