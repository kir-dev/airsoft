# == Schema Information
#
# Table name: event_types
#
#  id         :bigint           not null, primary key
#  name       :string
#  form_data  :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class EventType < ApplicationRecord
  has_many :events
end
