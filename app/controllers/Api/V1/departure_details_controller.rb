class Api::V1::DepartureDetailsController < ApplicationController
  before_action :set_departure_detail, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /departure_details
  # GET /departure_details.json
  def index
    @departure_details = DepartureDetail.all
    render json: DepartureDetailSerializer.new(@departure_details).serializable_hash.to_json
  end

  # GET /departure_details/1
  # GET /departure_details/1.json
  def show
    render json: render_departure_detail
  end

  # POST /departure_details
  # POST /departure_details.json
  def create
    @departure_detail = DepartureDetail.new(departure_detail_params)

    if @departure_detail.save
      render json: render_departure_detail, status: :created
    else
      render json: @departure_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /departure_details/1
  # PATCH/PUT /departure_details/1.json
  def update
    if @departure_detail.update(departure_detail_params)
      render json: render_departure_detail, status: :ok
    else
      render json: @departure_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /departure_details/1
  # DELETE /departure_details/1.json
  def destroy
    @departure_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departure_detail
      @departure_detail = DepartureDetail.find(params[:id])
    end

    def render_departure_detail
      return DepartureDetailSerializer.new(@departure_detail).serializable_hash.to_json
    end

    # Only allow a list of trusted parameters through.
    def departure_detail_params
      params.permit(:departure_id, :product_id, :quantity, :price, :subtotal)
    end
end
