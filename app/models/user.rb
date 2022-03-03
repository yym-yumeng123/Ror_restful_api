class User < ApplicationRecord
  # 添加一个密码属性 只是用来保存用户传递进来的密码, 不会存储到数据库
  attr_accessor :password

  # 验证(约束)
  validates :nickname, presence: true, length: {minimum: 1, maximum:150}
  validates :gender, presence: true, inclusion: { in: [0,10,20] }
  # 使用自定义验证器
  # 导入系统系统的验证器
  include ActiveModel::Validations
  validates_with PhoneValidator
  # 使用自定义右键验证器
  # 后面的email，是通过验证器命令Email识别的
  # 这就是Rails的约定优于配置的体现
# 可以使用自带的验证
  # validates :email, presence: true, email: true
  validates :email, email: true

  # 默认查询参数
  # 默认按创建时间倒序排列
  default_scope -> { order(created_at: :desc) }
end
