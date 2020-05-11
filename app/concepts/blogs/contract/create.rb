module Blog::Contract
    class Create < Reform::Form
      property :content
      property :title
      
      collection :comments, populate_if_empty: Comment do
        property :comment
      end

      validation do
        params do
          required(:content).filled
          required(:title).filled
        end
      end
    end
end

