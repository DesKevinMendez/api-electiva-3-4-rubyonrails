class Api::V1::EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /entries
  # GET /entries.json
  def index
    @entries = Entrie.all
    render json: EntrieSerializer.new(@entries).serializable_hash.to_json
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
    render json: render_entry
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entrie.new(entry_params)

    if @entry.save
      render json:render_entry, status: :created
    else
      render json: @entry.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    if @entry.update(entry_params)
      render json:render_entry, status: :ok
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

    def render_entry
      return EntrieSerializer.new(@entry).serializable_hash.to_json
    end
    # Only allow a list of trusted parameters through.
    def entry_params
      params.permit(:id_document, :warehouse_id, :user_id, :date, :origin_warehouse_id, :total)
    end
end
