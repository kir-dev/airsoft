class Post < ApplicationRecord
  has_one :event
  enum static_id: [:about]
end
