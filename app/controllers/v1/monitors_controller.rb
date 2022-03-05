class V1::MonitorsController < ApplicationController
  def version
    version = {
      "name" => ENV['VERSION_NAME'],
      "code" => ENV['VERSION_CODE']
    }

    render json: version
  end

  # 测试不要登录
  # 但如果登录了，会包含用户信息
  def canLogin
    if current_user
      user_info = {
        "id:":current_user.id,
        "nickname:":current_user.nickname
      }
    end
    data = {
      "message" => "测试不要登录, 但如果登录了, 会包含用户信息! ",
      "user":user_info
    }
    render json: data
  end

  # 接口测试要登录
  def needLogin
    if !current_user
      # 用户信息为空
      # 直接返回未认证
      unauthenticated!
      return
    end
    # 先显示名称
    # 因为名称对用户来说更友好
    # 这里所说的用户，也可代指除程序员
    data = {
        "message" =>"该接口需要登录! ",
        "user":{
          "id:":current_user.id,
          "nickname:":current_user.nickname
        }
    }
    render json: data
  end
end
