class Customer < ApplicationRecord
  has_many :carts
  has_many :orders
  has_many :shippings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image

  def active_for_authentication?
    super && self.status #ここでstatusがfalseだとログインできない
  end

  def total_payment
    total = 0
    self.carts.each do |cart|
      total = total + cart.quantity * (cart.item.price * 1.1).floor
    end
    return total
  end
end
