class MonitorsController < ApplicationController
  def version
    version = {
      "name" => ENV['VERSION_NAME'],
      "code" => ENV['VERSION_CODE']
    }

    render json: version
  end
end
