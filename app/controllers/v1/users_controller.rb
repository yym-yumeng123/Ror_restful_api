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
    # 可以不用手动校验, 模型数据库都设置了校验, 校验不通过, 是不能保存成功的

    # 参数校验
    if @user.phone.blank? or @user.email.blank? or @user.password.blank?
      render_error(ERROR_EMPTY_EMAIL_OR_PASSWORD, ERROR_EMPTY_EMAIL_OR_PASSWORD_MESSAGE)
      return
    end
    
    # 判断用户是否存在
    if User.exists?(phone: @user.phone) or User.exists?(email: @user.email)
      render_error(ERROR_USER_EXIST, ERROR_USER_EXIST_MESSAGE)
      return
    end

    if @user.save
      render_save_success @user
    else
      render_detail_error @user.errors
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
      params.permit(:nickname, :avatar, :description, :gender, :birthday, :email, :phone, :password)
    end
end
