class V1::SessionsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  
  def create
    # 登录参数校验
    # 登录顺序为邮箱，手机号，qq，微信
    # 可以加一个style字段区分是那种类型
    # type在Rails项目数据库中有特殊用途
    # 但这会增加更多逻辑，同时客户端调用还要区分

    email = params[:email]
    phone = params[:phone]
    password = params[:password]

    if email.present? && password.present?
      user = User.find_by_email email
      attribute = "password"
      digest = password

    elsif phone.present? && password.present?
      user = User.find_by(phone: params[:phone])
      attribute = "password"
      digest = password
    end

    # 用户存在
    if user
      # 用户存在, 还要判断认证是否存在  authenticated? user.rb中定义
      if user.authenticated? attribute, digest
        # 随机字符串，加密1次
        session = DigestUtil.encrypt(DigestUtil.random_base64_32)
        # 保存数据库，在加密一次
        session_digest = DigestUtil.encrypt(session)

        # 该方法不会走验证逻辑
        if user.update_attribute(:session_digest, session_digest)
          # 登录成功
          # 向用户返回userId,session
          # 返回userId的目的是，session加密不能直接查询
          # 需要先找到用户

          # 向客户端返回信息
          render_json({user: user.id, session: session})
        else
          # 保存失败，也算登录失败
          render_error(ERROR_USERNAME_OR_PASSWORD, ERROR_USERNAME_OR_PASSWORD_MESSAGE)
        end
        
      else
        # 保存失败，也算登录失败
        render_error(ERROR_USERNAME_OR_PASSWORD, ERROR_USERNAME_OR_PASSWORD_MESSAGE)
      end
      
    else
      render_error(ERROR_USER_NOT_EXIST, ERROR_USER_NOT_EXIST_MESSAGE)
    end
    

    
  end

  def destroy
    current_user.update_attribute(:session_digest, "")
  end
end
