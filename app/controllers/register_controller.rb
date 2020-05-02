class RegisterController < ApplicationController
  before_action :doorkeeper_authorize!
  before_action :validate_password, only: [:create]
  
  def create
    @user = User.new(user_params)

    if @user.save
      render json: {
        user: @user
      }, status: :created
    else

      render json: @user.errors, status: :unprocessable_entity
    end

  end

  private 
    def validate_password
      if params[:password_confirmation] == nil
        render json: {
          password_confirmation: [
            "password_confirmation is required"
          ]
        }, status: :bad_request
      else

        if params[:password] != params[:password_confirmation]
          render json: {
            password: [
              "Password and password_confirmation doesn't match, try again"
            ]
          }, status: :bad_request
        end
      end

    end

    def user_params
      params.permit(:first_name, :last_name, :username, :email, :role_id, :password, :password_confirmation)
    end
end
