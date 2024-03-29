# == Schema Information
#
# Table name: posts
#
#  id                :bigint           not null, primary key
#  title             :string
#  short_description :string
#  static_id         :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Post < ApplicationRecord
  has_one_attached :image
  has_rich_text :formatted_document
  enum static_id: { common: 0, about: 1, rent: 2 }

  default_scope { where(static_id: :common) }
end
