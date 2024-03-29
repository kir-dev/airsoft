# == Schema Information
#
# Table name: participations
#
#  id         :bigint           not null, primary key
#  form_data  :jsonb
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_participations_on_event_id              (event_id)
#  index_participations_on_event_id_and_user_id  (event_id,user_id) UNIQUE
#  index_participations_on_user_id               (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (event_id => events.id)
#  fk_rails_...  (user_id => users.id)
#
class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  scope :for_event, ->(event_id) { where(event_id: event_id) }

  def can_edit?(user)
    event.can_participate? && (event.participants.include?(user) || user.admin?)
  end
end
