class Spirit < ApplicationRecord
  has_many :orders
  has_many :spirit_aromas
  has_many :aromas, through: :spirit_aromas
  has_many :families, through: :aromas


  geocoded_by :country
  after_validation :geocode, if: :will_save_change_to_country?

  has_many :experiences
  has_many :users, through: :experiences

end
