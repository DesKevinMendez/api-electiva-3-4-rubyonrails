class WarehausesController < ApplicationController
  before_action :set_warehause, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /warehauses
  def index
    @warehauses = Warehause.all

    render json: @warehauses
  end

  # GET /warehauses/1
  def show
    render json: @warehause
  end

  # POST /warehauses
  def create
    @warehause = Warehause.new(warehause_params)

    if @warehause.save
      render json: @warehause, status: :created, location: @warehause
    else
      render json: @warehause.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /warehauses/1
  def update
    if @warehause.update(warehause_params)
      render json: @warehause
    else
      render json: @warehause.errors, status: :unprocessable_entity
    end
  end

  # DELETE /warehauses/1
  def destroy
    @warehause.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_warehause
      @warehause = Warehause.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def warehause_params
      params.permit(:name, :address, :phone)
    end
end
