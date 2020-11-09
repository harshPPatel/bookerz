class Order < ApplicationRecord
  belongs_to :user
  has_many :books, through :order_books
end
