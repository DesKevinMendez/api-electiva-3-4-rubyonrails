class Api::V1::ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /providers
  # GET /providers.json
  def index
    @providers = Provider.all
  end

  # GET /providers/1
  # GET /providers/1.json
  def show
  end

  # POST /providers
  # POST /providers.json
  def create
    @provider = Provider.new(provider_params)

    if @provider.save
      render :show, status: :created
    else
      render json: @provider.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /providers/1
  # PATCH/PUT /providers/1.json
  def update
    if @provider.update(provider_params)
      render :show, status: :ok
    else
      render json: @provider.errors, status: :unprocessable_entity
    end
  end

  # DELETE /providers/1
  # DELETE /providers/1.json
  def destroy
    @provider.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_provider
      @provider = Provider.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def provider_params
      params.permit(:name, :address, :email)
    end
end
