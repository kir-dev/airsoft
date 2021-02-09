# == Schema Information
#
# Table name: rents
#
#  id         :bigint           not null, primary key
#  end_date   :datetime
#  item_id    :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class RentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
