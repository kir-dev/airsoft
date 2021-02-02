class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:authsch]
  has_many :rents
  has_many :items, through: :rents
  alias rentals items

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider

      data = auth.extra.raw_info
      user.uid      = data.internal_id
      user.email    = data.mail
      user.name     = data.displayName
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
