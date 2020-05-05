class Api::V1::EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /entries
  # GET /entries.json
  def index
    @entries = Entrie.all
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entrie.new(entry_params)

    if @entry.save
      render :show, status: :created
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    if @entry.update(entry_params)
      render :show, status: :ok
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entrie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.permit(:id_document, :warehouse_id, :user_id, :date, :origin_warehouse_id, :total)
    end
end
