# == Schema Information
#
# Table name: rents
#
#  id         :bigint           not null, primary key
#  comment    :string
#  end_date   :datetime
#  order      :string
#  start_date :datetime
#  status     :integer          default("pending")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_rents_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Rent < ApplicationRecord
  belongs_to :user
  enum status: { pending: 0, accepted: 1, rented: 2, closed: 3 }

  validates :order, presence: true

  def compact_order
    order.truncate(30)
  end
end
