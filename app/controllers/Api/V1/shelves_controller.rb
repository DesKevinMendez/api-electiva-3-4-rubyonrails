class Api::V1::ShelvesController < ApplicationController
  before_action :set_shelf, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /shelves
  # GET /shelves.json
  def index
    @shelves = Shelf.all
    # render json: {
    #   shelves: @shelves
    # }
    render :index
  end

  # GET /shelves/1
  # GET /shelves/1.json
  def show
    render :show
  end

  # POST /shelves
  # POST /shelves.json
  def create
    puts shelf_params

    @shelves = Shelf.new(shelf_params)

    if @shelves.save
      render :show, status: :created
    else
      render json: @shelves.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shelves/1
  # PATCH/PUT /shelves/1.json
  def update
    if @shelves.update(shelf_params)
      render :show, status: :ok
    else
      render json: @shelves.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shelves/1
  # DELETE /shelves/1.json
  def destroy
    @shelves.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shelf
      @shelves = Shelf.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shelf_params
      params.permit(:hall, :shelving, :floor, :warehouse_id)
    end
end
