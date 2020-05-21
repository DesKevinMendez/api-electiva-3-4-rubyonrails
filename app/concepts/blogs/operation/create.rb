require "trailblazer/operation"
module BlogPost
    class Create < Trailblazer::Operation
        
        step Model(Blog, :new)
        
        step Contract::Build(constant: Blog::Contract::Create )
        step Contract::Validate()
        step Contract::Persist()

    end
end