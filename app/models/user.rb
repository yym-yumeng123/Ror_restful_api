class User < ApplicationRecord

  # 验证(约束)
  validates :nickname, presence: true, length: {minimum: 1, maximum:150}
  validates :gender, presence: true, inclusion: { in: [0,10,20] }
  
end
