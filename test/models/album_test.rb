# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  date       :date
#  short_desc :string
#  title      :string(128)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
