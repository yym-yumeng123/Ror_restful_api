class Collection < ApplicationRecord
  # 一个收藏属于一个歌单
  belongs_to :sheet
  # 一个收藏属于一个用户
  belongs_to :user
end
