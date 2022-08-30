class Aroma < ApplicationRecord
  has_many :spirit_aromas
  has_many :spirits, through: :spirit_aromas
  belongs_to :family
end
