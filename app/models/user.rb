# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  admin                  :boolean
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  provider               :string
#  uid                    :string
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:authsch]
  has_many :rents
  has_many :items, through: :rents
  has_many :participations
  has_many :events, through: :participations
  alias rentals items
  alias participated_events events

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
