class ApplicationController < ActionController::API
  before_action :destroy_session

  # 不使用session
  def destroy_session
    request.session_options[:skip] = true
  end
  # 全局错误处理
  # 当然也可以只捕获一类异常
  # 他不能捕捉ActionController::RoutingError异常
  # 该异常返回404，和我们期望一样，所以不在捕捉他
  # 会处理其他位置（包括控制器，模型等）没有捕捉的错误
  rescue_from Exception, with: :all_exception

  def all_exception error
    logger.error {
      "Application error:#{error}"
    }
    raise error
  end

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
  
  
  
  # 创建成功响应
  def render_save_success data
    render json: {data: data}, status: :created
  end

  def render_error code, message
    render json: {status: code, message: message, status: :ok}
  end
  
  # 返回默认错误响应
  def render_default_error
    render_error 20, "参数错误, 请稍后再试!"
  end
  
  def render_detail_error detail
    render json: {status: ERROR_ARGUMENT, message: ERROR_ARGUMENT_MESSAGE, detail: detail}
  end

  def render_json object
    render_json_and_code(object, :ok)
  end
  
  def render_json_and_code object, code
    render json: {data: object}, status: code
  end
  
end
