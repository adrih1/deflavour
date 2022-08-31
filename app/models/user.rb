class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :experiences
  has_many :spirits, through: :experiences

  def create_experiences(params)
    spirit_ids = params.dig(:experience, :spirit).reject(&:blank?)

    spirit_ids.each do |id|
      Experience.create(user: self, spirit: Spirit.find(id))
    end
  end
end
