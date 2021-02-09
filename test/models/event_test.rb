# == Schema Information
#
# Table name: events
#
#  id            :bigint           not null, primary key
#  date          :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  event_type_id :integer
#  post_id       :bigint           not null
#
# Indexes
#
#  index_events_on_post_id  (post_id)
#
# Foreign Keys
#
#  fk_rails_...  (post_id => posts.id)
#
require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
