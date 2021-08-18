# == Schema Information
#
# Table name: events
#
#  id            :bigint           not null, primary key
#  deadline      :datetime
#  end           :datetime
#  name          :string
#  start         :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  event_type_id :integer
#
class Event < ApplicationRecord
  belongs_to :event_type, optional: true
  has_many :participations
  has_many :users, through: :participations
  has_rich_text :description
  alias participants users

  def can_participate?(user)
    event_type.present? && Time.now.utc < deadline.utc
  end

  def already_participating?(user)
    participants.include?(user)
  end

end
