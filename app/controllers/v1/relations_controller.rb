class V1::RelationsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    # post /v1/sheets/:sheet_id/relations

    # body: {
    #   id: 1
    # }
    # 后台收到的参数：{"id"=>1, "sheet_id"=>"1", "relation"=>{"id"=>1}}
    # 通过current_user.sheets.find
    # 限定了，只能向自己的歌单中添加歌曲

    relation = current_user.sheets.find(params[:sheet_id]).relations.build(song_id: params[:id], user_id: current_user.id)

    if !relation.save
      render_default_error
    end
  end
  
  def destroy
    # /v1/sheets/:sheet_id/relations/:id
    # 这里后面传的Id是，歌曲Id，而不是relationId
    # 理论上来说，应该传relationId
    current_user.sheets.find(params[:sheet_id]).relations.find_by_song_id(params[:id]).destroy
  end

end
