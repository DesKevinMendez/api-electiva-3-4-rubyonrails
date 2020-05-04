class Api::V1::InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
    
  # GET /inventories
  # GET /inventories.json
  def index
    @inventories = Inventorie.all
    # Renderize to views/api/v1/inventorie/index.json.jbuilder

  end

  # GET /inventories/1
  # GET /inventories/1.json
  def show
    # Renderize to views/api/v1/inventorie/show.json.jbuilder
  end

  # POST /inventories
  # POST /inventories.json
  def create
    @inventory = Inventorie.new(inventory_params)

    if @inventory.save
      render :show, status: :created
    else
      render json: @inventory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inventories/1
  # PATCH/PUT /inventories/1.json
  def update
    if @inventory.update(inventory_params)
      render :show, status: :ok
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

    # Only allow a list of trusted parameters through.
    def inventory_params
      params.permit(:quantity, :warehouse_id)
    end
end
