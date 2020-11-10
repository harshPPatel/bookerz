class Store < ApplicationRecord
  has_many :books, dependent: :nullify
  belongs_to :address
end
