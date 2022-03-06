class Ad < ApplicationRecord
  belongs_to :user

  validates :banner, presence: true
end
