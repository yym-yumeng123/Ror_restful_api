class CreateSheets < ActiveRecord::Migration[6.0]
  def change
    create_table :sheets do |t|
      t.string :title, null: false
      # 封面
      t.string :banner
      t.string :description

      # 点击率(点击到详情), 使用 bigInt
      t.integer :clicks_count, :limit => 8 #By default SQL String limit 255 character 
      # 收藏数
      t.integer :collections_count
      # 评论数
      t.integer :comments_count
      # 谁创建了这个歌单
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
