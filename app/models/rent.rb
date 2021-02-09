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
class Rent < ApplicationRecord
  belongs_to :item
  belongs_to :user
end
