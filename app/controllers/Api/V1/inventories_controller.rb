class Api::V1::InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
    
  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventorie.all
    render json: InventorieSerializer.new(@inventories).serializable_hash.to_json

  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
    render json: render_inventorie

  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventorie.new(inventory_params)

    if @inventory.save
      render json: render_inventorie, status: :created
    else
      render json: @inventory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    if @inventory.update(inventory_params)
      render json: render_inventorie, status: :ok
    else
      render json: @inventory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /inventories/1
  # DELETE /inventories/1.json
  def destroy
    @inventory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventorie.find(params[:id])
    end

    def render_inventorie

      return InventorieSerializer.new(@inventory).serializable_hash.to_json
    end

    # Only allow a list of trusted parameters through.
    def inventory_params
      params.permit(:quantity, :warehouse_id, :product_id)
    end
end
