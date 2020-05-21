class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @CommentSerializer = Comment.all

    render json: CommentSerializer.new(@CommentSerializer).serializable_hash.to_json
  end

  # GET /comments/1
  def show
    render json: render_comment(@comment)
  end

  # POST /comments
  def create

    operation = CommentBlog::Create.call(params: params)
    response_operation(operation)
    
  end

  # PATCH/PUT /comments/1
  def update

    operation = CommentBlog::Update.(params: params)
    response_operation(operation)

  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def render_comment comment

      return CommentSerializer.new(comment).serializable_hash.to_json
      
    end

    def response_operation operation
      if operation.success?
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
end
