class Story < ApplicationRecord
  belongs_to :user
  has_many :records, dependent: :destroy

  validates :title, presence: true
  validates :started_on, presence: true

  def elapsed_days
    (Date.current - started_on).to_i + 1
  end
end
