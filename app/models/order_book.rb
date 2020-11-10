class OrderBook < ApplicationRecord
  belongs_to :order
  belongs_to :book

  validates :quantity, :order_price, presence: true
  validates :order_price, numericality: { greater_than: 0 }
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
end
