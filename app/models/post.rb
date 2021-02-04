class Post < ApplicationRecord
  has_one :event
  has_one :album
  has_rich_text :formatted_document
  enum static_id: [:about]
end
