module Blog::Contract
    class Create < Reform::Form
      property :content
      property :title
            
      validation do
        params do
          required(:content).filled
          required(:title).filled
        end
      end

    end
end