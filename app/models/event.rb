class Event < ApplicationRecord
  belongs_to :post
  belongs_to :event_type
  has_many :participations
  has_many :users, through: :participations
  alias participants users
end
