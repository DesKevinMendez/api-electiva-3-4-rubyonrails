class ApplicationController < ActionController::API

    # Personalize response to inauthorize
    def doorkeeper_unauthorized_render_options(error: nil)
        { json: { error: "Not authorized, please, log in or ask an administrator for access" } }
    end
end
