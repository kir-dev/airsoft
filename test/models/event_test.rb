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
require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
