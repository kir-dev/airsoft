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
require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
