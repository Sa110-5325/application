class Item < ApplicationRecord
  has_many :carts
  has_many :orderd_items
  belongs_to :genre
  attachment :image
end
