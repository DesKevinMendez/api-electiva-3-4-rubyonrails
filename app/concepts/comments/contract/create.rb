module Comment::Contract
    class Create < Reform::Form
      property :comment
      property :blog_id
            
      validation do
        params do
          required(:comment).filled
          required(:blog_id).filled
        end

        rule(:blog_id) do
          blog = Blog.find_by(id: value)
          key.failure('must be exists') if !blog
        end

      end

    end
end