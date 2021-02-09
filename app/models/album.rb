class Album < ApplicationRecord
  belongs_to :post
  has_many_attached :images



  def thumbnail
    if images.empty?
      "https://dummyimage.com/300x200/ffffff/000000.png&text=%3Cempty%3E"
    else 
      images.first.variant gravity: "Center", resize: "300x200^", crop: "400x400+0+0" 
    end
  end
end
