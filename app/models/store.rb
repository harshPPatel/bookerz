class Store < ApplicationRecord
  has_many :books, dependent: :nullify
end
