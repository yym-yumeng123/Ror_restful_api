class V1::SongsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_data, only: [:update, :destroy]


  def show
    @song = Song.find(params[:id])
  end

  def create
    @song = current_user.songs.build(data_params)
    if @song.save!
      render_save_success @song
    else
      render_default_error
    end
  end
  

  private
    def data_params
      params.permit(:title, :banner, :uri, :style, :lyric, :singer_id)
    end
    
    def set_data
      @song = current_user.songs.find params[:id]
    end
  
end
