class Order < ApplicationRecord
  belongs_to :user
  belongs_to :spirit
  has_one :review
end