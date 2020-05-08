class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update, :destroy]

  # GET /blogs
  def index
    @blogs = Blog.all
    render json: BlogSerializer.new(@blogs).serializable_hash.to_json
  end

  # GET /blogs/1
  def show
    render json: render_blog(@blog)
  end

  # POST /blogs
  def create
    
    operation = BlogPost::Create.call(params: blog_params)
    response_operation(operation)
    
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      render json: render_blog(@blog)
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # DELETE /blogs/1
  def destroy
    @blog.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
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

    def render_blog blog

      return BlogSerializer.new(blog).serializable_hash.to_json
      
    end
    # Only allow a trusted parameter "white list" through.
    def blog_params
      params.permit(:content, :title)
    end
end
