class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :orders
  has_many :experiences
  has_many :recommendations
  has_many :spirits, through: :experiences
  accepts_nested_attributes_for :experiences, reject_if: :all_blank, allow_destroy: true
  has_one :alcool_profile
  has_many :reviews
  has_many :reviewed_spirits, through: :reviews, source: :spirit

  def create_experiences(params)
    spirit_ids = params.dig(:experiences, :spirits, :spirit).reject(&:blank?)

    spirit_ids.each do |id|
      Experience.create(user: self, spirit: Spirit.find(id))
    end
  end

  def update
    if user.update(user_params)
      redirect_to users_path
    else
      render :edit
    end
  end


  private

  def user_params
    params
      .require(:user)
      .permit(
        todos_attributes: [:id, :_destroy, :description]
      )
  end
end
