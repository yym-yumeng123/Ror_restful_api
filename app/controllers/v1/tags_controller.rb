class V1::TagsController < ApplicationController
  def index
    parent_id = params[:parent_id]

    if parent_id.blank?
      # 查询第一层标签
      @tags = Tag.first_level
    else
      # 查询指定层级
      @tags = Tag.next_level(parent_id)
    end
    
  end
  
end
