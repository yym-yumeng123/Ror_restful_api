# 定义一个模块
module DigestUtil
  # 加密
  # 方法前面加self就是静态方法
  def self.encrypt(data)
    # 是否是低成本，默认：生产环境为false
    # 其实就是加密强度，开发环境可以不用这么高的强度
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost

    # 加密
    return BCrypt::Password.create(data, cost: cost)
  end

  # 生成32位 base64编码
  def self.random_base64_32
    return SecureRandom.urlsafe_base64(32)
  end
end