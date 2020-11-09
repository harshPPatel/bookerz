class Book < ApplicationRecord
  belongs_to :author
  belongs_to :store
  belongs_to :book_category
  has_many :orders, through :order_books
end
