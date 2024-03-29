# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  provider               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  uid                    :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:authsch]

  has_many :rents, dependent: :destroy
  has_many :items, through: :rents
  has_many :participations, dependent: :destroy
  has_many :events, through: :participations
  alias rentals items
  alias participated_events events
  attribute :admin, default: false
  validates :name, presence: true, length: { minimum: 3 }

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider

      data          = auth.extra.raw_info
      user.uid      = data.internal_id
      user.email    = data.mail
      user.name     = data.displayName
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
