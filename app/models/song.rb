class Song < ApplicationRecord
  # 一个歌曲属于一个用户
  belongs_to :user

  # 歌手 引用的是用户对象, 一首音乐属于一个歌手, 类名是 User, 外键是 
  belongs_to :singer, class_name: "User", foreign_key: "singer_id"

  # 和歌单有各个关系
  has_many :relations
  # 一首音乐, 有多个歌单, 这个关系通过 relations 管理
  has_many :sheets, through: :relations

  validates :title, presence: true, length: {minimum: 2,maximum: 20 }
  # 封面
  validates :banner, presence: true
  # 音乐的url
  validates :uri, presence: true
    
  # 歌词类型
  validates :style, inclusion: { in: [STYLE_LYRIC,STYLE_LYRIC_KSC] }

  default_scope -> { order(created_at: :desc) }
end
