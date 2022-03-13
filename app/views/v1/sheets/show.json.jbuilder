json.data do
  json.(@sheet, :id, :title, :banner, :description, :clicks_count, :collections_count, :comments_count)

  if @collection_id
    json.isCollection @collection_id
  end
  
end