class ApplicationController < ActionController::API
  before_action :destroy_session

  # 导入ApplicationHelper
  # 这样就能访问里面的属性，方法
  # 这是Ruby基础，不讲解
  include ApplicationHelper

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
