class Record < ApplicationRecord
  belongs_to :story

  validates :memo, presence: true
  validates :recorded_on, presence: true
end
