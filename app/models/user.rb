class User < ApplicationRecord
  has_many :ads

  # 添加一个密码属性 只是用来保存用户传递进来的密码, 不会存储到数据库
  attr_accessor :password

  # 验证(约束)
  validates :nickname, presence: true, length: {minimum: 1, maximum:150}
  validates :gender, presence: true, inclusion: { in: [0,10,20] }
  validates :password, presence: true, length: {minimum: 6,maximum: 15 }
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

  # 重写设置密码方法
  def password=(unencrypted_password)
    if unencrypted_password.nil?
      # 如果密码为空，就不计算加密密码
      self.password_digest = nil
    elsif !unencrypted_password.empty?
      # 如果加密密码为空
      # 才计算，只有第一次创建用户才会计算
      @password = unencrypted_password
      # 创建密码
      self.password_digest = DigestUtil.encrypt(unencrypted_password)
    end
  end

  def authenticated? attribute, value
    digest = self.send("#{attribute}_digest")

    return false if digest.nil?

    # 使用传递进来的密码和加密的密码比较
    BCrypt::Password.new(digest).is_password?(value)
  end
  
end
