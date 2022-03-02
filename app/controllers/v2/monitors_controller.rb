class V2::MonitorsController < ApplicationController
  def version
    # =>：是Ruby语法
    version = {
      "version" => {
          "name" => ENV['VERSION_NAME'],
          "code" => ENV['VERSION_CODE']
      }
    }
    render json: version
  end
end
