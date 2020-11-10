class Order < ApplicationRecord
  belongs_to :user
  has_many :books, through: :order_books

  validates :order_date, :current_gst, :current_pst, presence: true
  validates :current_pst,
            :current_pst,
            numericality: { greater_than_or_equal_to: 0,
                            less_than_or_equal_to:    1 }
end
