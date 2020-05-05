class Api::V1::BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /brands
  # GET /brands.json
  def index
    @brands = Brand.all
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(brand_params)

    if @brand.save
      render :show, status: :created
    else
      render json: @brand.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /brands/1
  # PATCH/PUT /brands/1.json
  def update
    if @brand.update(brand_params)
      render :show, status: :ok
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

    # Only allow a list of trusted parameters through.
    def brand_params
      params.permit(:name)
    end
end
