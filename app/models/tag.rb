class Tag < ApplicationRecord
  # 一个标签属于一个用户
  belongs_to :user

  # 一个标签有多个子标签, 类名为 Tag, 外键id 为 parent_id
  has_many :childs, class_name: "Tag", foreign_key: "parent_id"
  # 一个标签可以属于一个标签
  # optional: true：表示parent_id为可选
  belongs_to :parent, class_name: "Tag", optional: true

  validates :title, presence: true, length: {maximum: 15}
end
