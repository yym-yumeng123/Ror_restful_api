class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      # 标签标题
      t.string :title, :null => false

      # 它是父层级 id, 
      # 添加foreign_key，该值就不能为null, 因为最外面的 parent_id 可以为null, 所以不能使用 foreign_key
      # t.references :parent, foreign_key: true, 
      t.references :parent, index: true

      # 谁创建了这个标签
      t.references :user, foreign_key: true

      t.timestamps
    end

    # 添加索引 标题, 用户ID 唯一索引
    add_index :tags, [:title, :user_id], :unique =>  true
  end
end
