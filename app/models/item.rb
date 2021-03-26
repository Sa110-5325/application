class Item < ApplicationRecord
  has_many :carts
  has_many :orderd_items
  has_many :genres
end
