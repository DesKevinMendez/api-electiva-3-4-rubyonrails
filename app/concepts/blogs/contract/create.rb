module Blog::Contract
    class Create < Reform::Form
      
      property :content
      property :title
  
      validates :content,  presence: true
      validates :title, presence: true

    end
end