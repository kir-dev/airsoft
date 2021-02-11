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
    if images.empty?
      ActionController::Base.helpers.image_url('blank-album.png')
    else 
      images.first.variant gravity: "Center", resize: "300x200^", crop: "300x200+0+0" 
    end
  end
end
