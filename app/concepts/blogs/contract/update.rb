module Blog::Contract
    class Update < Reform::Form
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