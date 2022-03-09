class Sheet < ApplicationRecord
  belongs_to :user

  # 一个歌单有多个歌曲
  has_many :songs

  validates :title, presence: true
  
  default_scope -> { order(created_at: :desc)}
end
