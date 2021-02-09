class Album < ApplicationRecord
  belongs_to :post
  has_many_attached :images

  validates :post, uniqueness: true

  def thumbnail
    if images.empty?
      "http://ipsumimage.appspot.com/300x200?l=No%20uploads%20yet"
    else 
      images.first.variant gravity: "Center", resize: "300x200^", crop: "300x200+0+0" 
    end
  end
end
