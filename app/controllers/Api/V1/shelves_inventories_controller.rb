class Api::V1::ShelvesInventoriesController < ApplicationController
  before_action :set_shelves_inventory, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /shelves_inventories
  # GET /shelves_inventories.json
  def index
    @shelves_inventories = ShelvesInventorie.all
    render json: ShelveInventorieSerializer.new(@shelves_inventories).serializable_hash.to_json
  end

  # GET /shelves_inventories/1
  # GET /shelves_inventories/1.json
  def show
    render json: render_shelve_inventorie
  end

  # POST /shelves_inventories
  # POST /shelves_inventories.json
  def create
    @shelves_inventory = ShelvesInventorie.new(shelves_inventory_params)

    if @shelves_inventory.save
      render json: render_shelve_inventorie, status: :created
    else
      render json: @shelves_inventory.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shelves_inventories/1
  # PATCH/PUT /shelves_inventories/1.json
  def update
    if @shelves_inventory.update(shelves_inventory_params)
      render json: render_shelve_inventorie, status: :ok
    else
      render json: @shelves_inventory.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shelves_inventories/1
  # DELETE /shelves_inventories/1.json
  def destroy
    @shelves_inventory.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelves_inventory
      @shelves_inventory = ShelvesInventorie.find(params[:id])
    end

    def render_shelve_inventorie
      return ShelveInventorieSerializer.new(@shelves_inventory).serializable_hash.to_json
    end

    # Only allow a list of trusted parameters through.
    def shelves_inventory_params
      params.permit(:shelf_id, :inventorie_id, :quantity)
    end
end
