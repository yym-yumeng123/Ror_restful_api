json.data @tags do |tag|
  json.(tag, :id, :title)

  if tag.childs.present?
    json.child tag.childs do |tag|
      json.(tag, :id, :title)
    end
  end
end