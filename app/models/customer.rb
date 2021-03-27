class Customer < ApplicationRecord
  has_many :carts
  has_many :orders
  has_many :shippings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
end
