class User < ApplicationRecord

  # 验证(约束)
  validates :nickname, presence: true, length: {minimum: 1, maximum:150}
  validates :gender, presence: true, inclusion: { in: [0,10,20] }
  # 使用自定义验证器
  # 导入系统系统的验证器
  include ActiveModel::Validations
  validates_with PhoneValidator

  # 默认查询参数
  # 默认按创建时间倒序排列
  default_scope -> { order(created_at: :desc) }
end
