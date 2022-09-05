class Spirit < ApplicationRecord
  has_many :orders
  has_many :spirit_aromas, dependent: :destroy
  has_many :aromas, through: :spirit_aromas
  has_many :families, through: :aromas
  has_many :recommendations
  has_many :reviews


  geocoded_by :country
  after_validation :geocode, if: :will_save_change_to_country?

  has_many :experiences
  has_many :users, through: :experiences

  include PgSearch::Model

  # Code pour la search par type d'alcool
  pg_search_scope :search_btn, against: :category, using: {
    tsearch: { prefix: true }
  }

end
