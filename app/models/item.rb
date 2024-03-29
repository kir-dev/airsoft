# == Schema Information
#
# Table name: items
#
#  id          :bigint           not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Item < ApplicationRecord
  has_many :rents, dependent: :destroy
  has_many :users, through: :rents, dependent: :nullify
  alias renters users
end
