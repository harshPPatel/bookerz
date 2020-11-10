class BookCategory < ApplicationRecord
  has_many :books, dependent: :nullify

  validates :name, presence: true
end
