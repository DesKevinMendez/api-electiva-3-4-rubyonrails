class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :update, :destroy]

  # GET /blogs
  def index
    @blogs = Blog.all

    render json: BlogSerializer.new(@blogs).serializable_hash.to_json
  end

  # GET /blogs/1
  def show
    render json: render_blog
  end

  # POST /blogs
  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      render json: render_blog, status: :created, location: @blog
    else
      render json: @blog.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /blogs/1
  def update
    if @blog.update(blog_params)
      render json: render_blog
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

    def render_blog

      return BlogSerializer.new(@blog).serializable_hash.to_json
      
    end
    # Only allow a trusted parameter "white list" through.
    def blog_params
      params.require(:blog).permit(:content, :title)
    end
end
