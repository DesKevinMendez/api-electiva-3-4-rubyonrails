class Api::V1::ModelsController < ApplicationController
  before_action :set_model, only: [:show, :update, :destroy]
  before_action :doorkeeper_authorize!
  
  # GET /models
  # GET /models.json
  def index
    @models = Model.all
    render json: ModelSerializer.new(@models).serializable_hash.to_json
  end

  # GET /models/1
  # GET /models/1.json
  def show
    render json: render_model
  end

  # POST /models
  # POST /models.json
  def create
    @model = Model.new(model_params)

    if @model.save
      render json: render_model, status: :created
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /models/1
  # PATCH/PUT /models/1.json
  def update
    if @model.update(model_params)
      render json: render_model, status: :ok
    else
      render json: @model.errors, status: :unprocessable_entity
    end
  end

  # DELETE /models/1
  # DELETE /models/1.json
  def destroy
    @model.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model
      @model = Model.find(params[:id])
    end

    def render_model
      return ModelSerializer.new(@model).serializable_hash.to_json
    end

    # Only allow a list of trusted parameters through.
    def model_params
      params.permit(:name)
    end
end
