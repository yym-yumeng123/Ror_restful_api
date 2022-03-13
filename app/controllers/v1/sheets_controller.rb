class V1::SheetsController < ApplicationController
  # 过滤器
  before_action :set_sheet, only: [:update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @sheets = Sheet.all
  end

  def create
    @sheet = current_user.sheets.build(sheet_params)
    if @sheet.save
      render_save_success @sheet
    else
      render_default_error
    end
    
  end

  def show
    @sheet = Sheet.find(params[:id])

    if current_user && collection = current_user.collection?(params[:id])
      # 如果登录，就判断是否收藏
      # 这个判断可以其他位置也要用到
      # 所以可以定义在user中
      # 如果收藏了，就赋值到@collection_id
      @collection_id = true
    end
  end

  def update
    if @sheet.update sheet_params
      render_save_success @sheet
    else
      render_default_error
    end
  end

  def destroy
    @sheet.destroy
  end

  private
    def sheet_params
      params.permit(:title, :banner, :description)
    end

    def set_sheet
      @sheet = current_user.sheets.find params[:id]
    end
    
    
end
