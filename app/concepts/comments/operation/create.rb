require "trailblazer/operation"
module CommentBlog
    class Create < Trailblazer::Operation
        
        step Model(Comment, :new)
        
        step Contract::Build(constant: Comment::Contract::Create )
        step Contract::Validate()
        step Contract::Persist()
    
    end
end