# 歌曲歌单关联表
class CreateRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :relations do |t|
      # 歌曲id
      t.references :song, null: false, foreign_key: true
      # 歌单id
      t.references :sheet, null: false, foreign_key: true
      # 用户id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :relations, [:song_id, :sheet_id, :user_id], :unique =>  true
  end
end
