class Api::V1::EntryDetailsController < ApplicationController
  before_action :set_entry_detail, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /entry_details
  # GET /entry_details.json
  def index
    @entry_details = EntryDetail.all
    render json: EntryDetailSerializer.new(@entry_details).serializable_hash.to_json
  end

  # GET /entry_details/1
  # GET /entry_details/1.json
  def show
    render json: render_entry_detail
  end

  # POST /entry_details
  # POST /entry_details.json
  def create
    @entry_detail = EntryDetail.new(entry_detail_params)

    if @entry_detail.save
      render json:render_entry_detail, status: :created
    else
      render json: @entry_detail.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /entry_details/1
  # PATCH/PUT /entry_details/1.json
  def update
    if @entry_detail.update(entry_detail_params)
      render json:render_entry_detail, status: :ok
    else
      render json: @entry_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /entry_details/1
  # DELETE /entry_details/1.json
  def destroy
    @entry_detail.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry_detail
      @entry_detail = EntryDetail.find(params[:id])
    end

    def render_entry_detail
      return EntryDetailSerializer.new(@entry_detail).serializable_hash.to_json
    end

    # Only allow a list of trusted parameters through.
    def entry_detail_params
      params.permit(:entrie_id, :product_id, :quantity, :price, :subtotal)
    end
end
