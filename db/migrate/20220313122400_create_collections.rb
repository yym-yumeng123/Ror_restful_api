class CreateCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :collections do |t|
      t.references :sheet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    # 添加索引
    add_index :collections, [:sheet_id, :user_id], :unique =>  true
    #Ex:- add_index("admin_users", "username")
  end
end
