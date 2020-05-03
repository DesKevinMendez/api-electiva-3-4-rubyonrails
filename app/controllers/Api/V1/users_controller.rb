class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :doorkeeper_authorize!
  
  def index
    @users = User.all
    render :index
  end

  def show
    # render json: @user
    render :show
  end
  private
    def set_user
      @user = User.find(params[:id])
    end
end
