class Api::V1::BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /brands
  # GET /brands.json
  def index
    @brands = Brand.all
    json_string = BrandSerializer.new(@brands).serializable_hash.to_json
    render json: json_string

  end

  # GET /brands/1
  # GET /brands/1.json
  def show
    render json: render_brand
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      render json: render_brand, status: :created
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /brands/1
  # PATCH/PUT /brands/1.json
  def update
    if @brand.update(brand_params)
      render json: render_brand, status: :ok
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:id])
    end

    # Use callbacks for get a single brand
    def render_brand
      return BrandSerializer.new(@brand).serializable_hash.to_json
    end
    
    # Only allow a list of trusted parameters through.
    def brand_params
      params.permit(:name)
    end
end
