class Author < ApplicationRecord
  has_many :books, dependent: :delete_all

  validates :first_name, :last_name, :birth_year, presence: true
  validates :birth_year, numericality: { only_integer: true }
end
