class Post < ApplicationRecord
  has_one :event
  has_one :album
  enum static_id: [:about]
end
