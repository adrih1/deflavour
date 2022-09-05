class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spirit
  has_one :review
  AUTHORIZED_RATINGS = (1..10)
  validates :rating, inclusion: { in: AUTHORIZED_RATINGS }
  validates :content, presence: true, length: { minimum: 5 }
end
