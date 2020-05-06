class Api::V1::WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /warehouses
  def index
    
    @warehouses = Warehouse.all
    render json: WarehouseSerializer.new(@warehouses).serializable_hash.to_json

  end

  # GET /warehouses/1
  def show
    render json: render_warehouse
  end

  # POST /warehouses
  def create
    @warehouse = Warehouse.new(warehouse_params)

    if @warehouse.save
      render json: render_warehouse, status: :created
    else
      render json: @warehouse.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /warehouses/1
  def update
    if @warehouse.update(warehouse_params)
      render json: render_warehouse
    else
      render json: @warehouse.errors, status: :unprocessable_entity
    end
  end

  # DELETE /warehouses/1
  def destroy
    @warehouse.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warehouse
      @warehouse = Warehouse.find(params[:id])
    end

    def render_warehouse
      return WarehouseSerializer.new(@warehouse).serializable_hash.to_json
    end

    # Only allow a trusted parameter "white list" through.
    def warehouse_params
      params.permit(:name, :address, :phone)
    end
end
