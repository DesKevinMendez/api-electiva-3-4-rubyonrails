class Api::V1::ProductTypesController < ApplicationController
  before_action :set_product_type, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /product_types
  # GET /product_types.json
  def index
    @product_types = ProductType.all
  end

  # GET /product_types/1
  # GET /product_types/1.json
  def show
  end

  # POST /product_types
  # POST /product_types.json
  def create
    @product_type = ProductType.new(product_type_params)

    if @product_type.save
      render :show, status: :created
    else
      render json: @product_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /product_types/1
  # PATCH/PUT /product_types/1.json
  def update
    if @product_type.update(product_type_params)
      render :show, status: :ok
    else
      render json: @product_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /product_types/1
  # DELETE /product_types/1.json
  def destroy
    @product_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_type
      @product_type = ProductType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_type_params
      params.permit(:name)
    end
end
