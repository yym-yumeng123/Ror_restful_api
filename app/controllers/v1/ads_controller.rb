class V1::AdsController < ApplicationController
  # 回调, 在 更新和删除时, 先找到对应参数
  before_action :set_ad, only: [:update, :destroy]
  # 验证是否登录
  before_action :authenticate_user!, except: [:index]


  def index
    @ads = Ad.all
    # render json: @ads
  end

  def create
    @ad = current_user.ads.build(ad_params)
    if @ad.save
      render_save_success @ad
    else
      render_default_error
    end
  end

  def update
    if @ad.update ad_params
      render_save_success @ad
    else
      render_default_error
    end
    
  end

  def destroy
    @ad.destroy
  end

  private
    def ad_params
      params.permit(:title, :banner, :uri, :order)
    end

    def set_ad
      @ad = Ad.find params[:id]
    end
    
    
end
