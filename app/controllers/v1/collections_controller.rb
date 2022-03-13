class V1::CollectionsController < ApplicationController
  before_action :authenticate_user!

  def create
    # build方法，创建对象
    # 会在对象中添加对象Id
    # 对于下面代码，创建的collection
    # 会添加user_id
    collection = current_user.collections.build({sheet_id: params[:sheet_id]})

    # 等效下面代码
    # collection=Collection.new({sheet_id:params[:sheet_id],user_id:current_user.id})

    if collection.save!
    else
      render_default_error
    end
  end

  def destroy
    # id为歌单Id
    # 而不是collection对象Id
    current_user.collections.find_by_sheet_id(params[:id]).destroy
  end
end
