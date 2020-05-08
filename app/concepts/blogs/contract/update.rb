module Blog::Contract
    class Update < Reform::Form
      
      property :content
      property :title
  
      validates :content,  presence: true
      validates :title, presence: true
      
    end
end