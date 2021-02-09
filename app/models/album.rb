# == Schema Information
#
# Table name: albums
#
#  id         :bigint           not null, primary key
#  post_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Album < ApplicationRecord
  belongs_to :post
  has_many_attached :images



  def thumbnail
    images.first.variant gravity: "Center", resize: "400x400^", crop: "400x400+0+0"
  end
end
