require "trailblazer/operation"
module BlogPost
    class Update < Trailblazer::Operation
    
        class Present < Trailblazer::Operation
            step Model(Blog, :find_by)
            step Contract::Build( constant: Blog::Contract::Update )
        end

        step Nested(Present)
        step Contract::Validate()
        step Contract::Persist()
    
    end
end