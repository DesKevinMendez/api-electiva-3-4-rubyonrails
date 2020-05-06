class Api::V1::DeparturesController < ApplicationController
  before_action :set_departure, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /departures
  # GET /departures.json
  def index
    @departures = Departure.all
    render json: DepartureSerializer.new(@departures).serializable_hash.to_json
  end

  # GET /departures/1
  # GET /departures/1.json
  def show
    render json: render_departure
  end

  # POST /departures
  # POST /departures.json
  def create
    @departure = Departure.new(departure_params)

    if @departure.save
      render json: render_departure, status: :created
    else
      render json: @departure.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /departures/1
  # PATCH/PUT /departures/1.json
  def update
    if @departure.update(departure_params)
      render json: render_departure, status: :ok
    else
      render json: @departure.errors, status: :unprocessable_entity
    end
  end

  # DELETE /departures/1
  # DELETE /departures/1.json
  def destroy
    @departure.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_departure
      @departure = Departure.find(params[:id])
    end

    def render_departure
      return DepartureSerializer.new(@departure).serializable_hash.to_json
    end

    # Only allow a list of trusted parameters through.
    def departure_params
      params.permit(:id_document, :user_id, :warehouse_id, :date, :destination_warehouse_id, :total)
    end
end
