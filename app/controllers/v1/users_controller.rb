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
    begin
      if @user.save
        render json: @user, status: :created, location: v1_user_path(@user)
      else
        # 保存失败，直接返回错误码，和固定的错误信息
        # 响应码为202，表示请求服务器接收到了；可以返回200
        render json: {status: '20', message: '参数错误, 请稍后再试! '}, status: :ok
        # render json: @user.errors, status: :unprocessable_entity
      end
    rescue
      render json: {status: '10', message: '未知错误, 请稍后再试!'}, status: :accepted
    end
    
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
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
      params.require(:user).permit(:nickname, :avatar, :description, :gender, :birthday, :email, :phone, :password_digest, :session_digest, :reset_password_digest, :reset_password_sent_at, :confirmation_digest, :confirmed_at, :confirmation_sent_at, :qq_id, :qq_id_digest, :wechat_id, :wechat_id_digest)
    end
end
