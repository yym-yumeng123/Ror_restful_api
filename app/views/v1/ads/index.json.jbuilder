json.data @ads do |data|
  json.id data.id
  json.title data.title
  json.banner data.banner
  json.uri data.uri

  json.created_at data.created_at
end