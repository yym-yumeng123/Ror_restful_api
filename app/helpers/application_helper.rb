module ApplicationHelper
  # 认证相关, 从请求头中恢复用户
  def current_user
    # 如果已有用户, 直接返回
    # if @current_user.present?
    #   @current_user
    # end

    # session HTTP 是自动添加的
    user_string = request.get_header 'HTTP_USER'
    # 认证请求头
    authorization = request.authorization

    begin
      user = User.find user_string
      if user && user.authenticated?('session', authorization)
        @current_user = user
        logger.debug {
          "ApplicationController current_user:#{@current_user.id}"
        }
      else
        logger.debug {
          "ApplicationController current_user:null"
        }
      end
    rescue => e
      logger.debug {
        "ApplicationController current_user error:#{e}"
      }
    end
    
    @current_user
  end

  # 该action需要认证
  # 会中断请求，如果没登录
  # 会直接返回登录提示
  def authenticate_user!
    unauthenticated! if !current_user
  end

  def unauthenticated!
    render_json_and_code({ 'status': ERROR_UNAUTHORIZED, 'message': ERROR_UNAUTHORIZED_MESSAGE}, 401)
  end
end