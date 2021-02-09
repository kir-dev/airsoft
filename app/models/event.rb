# == Schema Information
#
# Table name: events
#
#  id            :bigint           not null, primary key
#  post_id       :bigint           not null
#  date          :datetime
#  event_type_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Event < ApplicationRecord
  belongs_to :post
  belongs_to :event_type
  has_many :participations
  has_many :users, through: :participations
  alias participants users
end
