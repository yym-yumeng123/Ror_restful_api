json.data do
  json.(@song, :id, :title, :banner, :uri, :clicks_count, :comments_count, :style, :lyric, :created_at)

  json.user do
    json.(@song.user, :id, :nickname)
  end

  json.singer do
    json.(@song.singer, :id, :nickname)
  end
end