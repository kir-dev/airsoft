# == Schema Information
#
# Table name: participations
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  event_id   :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :event
end
