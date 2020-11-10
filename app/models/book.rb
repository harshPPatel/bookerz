class Book < ApplicationRecord
  belongs_to :author
  belongs_to :store
  belongs_to :book_category
  has_many :order_books, dependent: :delete_all
  has_many :orders, through: :order_books
  has_one_attached :image

  validates :name, presence: true
end
