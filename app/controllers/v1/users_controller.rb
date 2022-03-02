class V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render_save_success @user
    else
      render_detail_error 20, '参数错误, 请稍后再试!', @user.errors
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render_save_success @user
    else
      # render json: @user.errors, status: :unprocessable_entity
      render_default_error
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      # params.require(:user)
      # params.require(:data)
      params.permit(:nickname, :avatar, :description, :gender, :birthday, :email, :phone, :password_digest, :session_digest, :reset_password_digest, :reset_password_sent_at, :confirmation_digest, :confirmed_at, :confirmation_sent_at, :qq_id, :qq_id_digest, :wechat_id, :wechat_id_digest)
    end
end
