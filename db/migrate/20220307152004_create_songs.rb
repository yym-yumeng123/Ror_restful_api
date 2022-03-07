class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title, null: false
      t.string :banner, null: false
      # 当前音乐的url
      t.string :uri, null: false
      t.integer :clicks_count, null: false, default: 0
      t.integer :comments_count, null: false, default: 0
      # 歌词类型 0:LRC，10:KSC
      t.integer :style
      # 歌词
      t.text :lyric

      t.references :user, null: false, foreign_key: true

      # 歌手Id，这里引用的是user 真实项目中，可能会将歌手放到单独的表中
      # 因为不是每个歌手都会来平台创建用户
      t.integer :singer_id

      t.timestamps
    end
  end
end
