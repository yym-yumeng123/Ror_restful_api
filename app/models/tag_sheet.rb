class TagSheet < ApplicationRecord
  belongs_to :tag
  belongs_to :sheet
  belongs_to :user
  
  # 验证（约束）
  # 不能为空
  validates :tag, presence: true
  validates :sheet, presence: true
  validates :user, presence: true
end
