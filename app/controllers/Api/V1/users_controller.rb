class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :doorkeeper_authorize!
  
  def index
    @users = User.all
    render json: UserSerializer.new(@users).serializable_hash.to_json
  end

  def byrole
    @users = User.where(role_id: params[:role_id])
    render json: UserSerializer.new(@users).serializable_hash.to_json
  
  end


  def show
    # render json: @user
    render json: render_user
  end
  private
    
    def set_user
      @user = User.find(params[:id])
    end

    def render_user
      puts @user
      return UserSerializer.new(@user).serializable_hash.to_json
      
    end
end
