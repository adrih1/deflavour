class Review < ApplicationRecord
  belongs_to :order
  has_one :review
end
