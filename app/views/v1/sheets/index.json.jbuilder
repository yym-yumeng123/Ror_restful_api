json.data @sheets do |sheet|
  json.(sheet, :id, :title, :banner, :description, :clicks_count, :collections_count, :comments_count)

  json.user do
    json.(sheet.user, :id, :nickname, :avatar)
  end

end