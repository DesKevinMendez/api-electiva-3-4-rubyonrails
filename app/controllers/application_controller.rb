class ApplicationController < ActionController::API

    # Personalize response to inauthorize
    def doorkeeper_unauthorized_render_options(error: nil)
        { json: { error: "Not authorized, please, log in or ask an administrator for access" } }
    end


    # All the information about the exception is in the parameter: exception
    rescue_from ActiveRecord::RecordNotFound, with: :show_not_found_errors
    def show_not_found_errors(exception)
        render json: {
            error: exception.message
        }, status: :not_found
    end
end
