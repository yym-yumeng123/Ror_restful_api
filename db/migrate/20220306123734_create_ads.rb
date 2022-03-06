class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      # 标题
      t.string :title

      # 图片地址, 相对地址, 显示时, 该局不同的环境拼接不同前缀
      t.string :banner

      # 点击后跳转的 url
      t.string :uri

      # 排序, 值越大, 越靠前
      t.integer :order

      # 哪个用户添加的
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
