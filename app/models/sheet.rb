class Sheet < ApplicationRecord
  belongs_to :user

  has_many :relations
  # 一个歌单有多个歌曲, 通过 relations 管理
  has_many :songs, through: :relations

  # 一个歌单，有多个收藏
  # 还有可以被多个用户收藏
  has_many :collections
  has_many :users, through: :collections


  validates :title, presence: true
  
  default_scope -> { order(created_at: :desc)}
end
