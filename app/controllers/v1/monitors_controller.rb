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
end
