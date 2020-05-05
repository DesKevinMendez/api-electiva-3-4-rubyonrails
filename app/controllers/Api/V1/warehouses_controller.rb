class Api::V1::WarehousesController < ApplicationController
  before_action :set_warehouse, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /warehouses
  def index
    @warehouses = Warehouse.all
  end

  # GET /warehouses/1
  def show
  end

  # POST /warehouses
  def create
    @warehouse = Warehouse.new(warehouse_params)

    if @warehouse.save
      render :show, status: :created
    else
      render json: @warehouse.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /warehouses/1
  def update
    if @warehouse.update(warehouse_params)
      render :show
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

    # Only allow a trusted parameter "white list" through.
    def warehouse_params
      params.permit(:name, :address, :phone)
    end
end
