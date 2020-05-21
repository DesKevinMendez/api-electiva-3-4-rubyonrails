class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: UserSerializer.new(@users).serializable_hash.to_json
  end

  # GET /users/1
  def show
    render json: render_user(@user)
  end

  # POST /users
  def create
    operation = UserPost::Create.call(params: params)
    response_operation(operation)
  end

  # PATCH/PUT /users/1
  def update

    operation = UserPost::Update.call(params: params)
    response_operation(operation)

  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def response_operation operation
      if operation.success?
        # render render_blog operation["model.blog"]
        render json: {
          blog: operation["model"]
        }, status: :created
  
      else
        error = operation["contract.default"].errors.messages
        render json: {
          error: error
        }, status: :bad_request
      end
  
    end

    def render_user user

      return UserSerializer.new(user).serializable_hash.to_json
      
    end

end
