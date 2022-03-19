class V1::SheetsController < ApplicationController
  # 过滤器
  before_action :set_sheet, only: [:update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @sheets = Sheet.all
  end

  # json 实现 带标签
  def create
    @sheet = current_user.sheets.build(sheet_params)
    if @sheet.save
      save_tags(params[:tags], @sheet.id)
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
      save_tags(params[:tags],@sheet.id)
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

    # 保存标签
    def save_tags(tags,sheet_id)
      # 歌单保存成功
    
      # 删除该歌单所有标签
      TagSheet.where("sheet_id = ? and user_id = ?", sheet_id, current_user.id).delete_all
    
      # 如果有标签
      if tags && tags.count > 0
        # 就要手动保存
        # 单个保存，没有批量保存快
        # 这里应该使用数据库事务
        tags.each do |tag|
          tag_sheet = TagSheet.new(id: tag["id"], tag_id: tag["tag_id"], sheet_id: sheet_id, user_id: current_user.id)
          tag_sheet.save
        end
      end
    end
    
    
end
