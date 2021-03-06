class Order < ApplicationRecord
  belongs_to :customer
  has_many :ordered_items
  enum payment: { クレジットカード: 0, 振り込み: 1 }
  enum status: { 入金待ち: 0, 入金確認:1, 製作中: 2, 発送準備中: 3, 発送済み: 4}

  def link_address
    "〒" + self.postal_code + "" + self.address
  end
end
