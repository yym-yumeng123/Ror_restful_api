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
