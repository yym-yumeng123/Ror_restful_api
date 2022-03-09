class Relation < ApplicationRecord
  belongs_to :song
  belongs_to :sheet
  belongs_to :user
end
