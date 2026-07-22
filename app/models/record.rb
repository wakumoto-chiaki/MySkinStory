class Record < ApplicationRecord
  belongs_to :story

  has_one_attached :image

  validates :memo, presence: true
  validates :recorded_on, presence: true
end
