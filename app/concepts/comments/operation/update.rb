require "trailblazer/operation"
module CommentBlog
    class Update < Trailblazer::Operation
    
        class Present < Trailblazer::Operation
            step Model(Comment, :find_by)
            step Contract::Build( constant: Comment::Contract::Update )
        end

        step Nested(Present)
        step Contract::Validate()
        step Contract::Persist()
    
    end
end