class Spirit < ApplicationRecord
  has_many :orders
  has_many :spirit_aromas
  has_many :aromas, through: :spirit_aromas
  has_many :families, through: :aromas
  has_many :recommendations


  geocoded_by :country
  after_validation :geocode, if: :will_save_change_to_country?

  has_many :experiences
  has_many :users, through: :experiences

  include PgSearch::Model

  pg_search_scope :search_btn, against: :category, using: {
    tsearch: { prefix: true }
  }

end
