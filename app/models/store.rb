class Store < ApplicationRecord
  has_many :books
  belongs_to :address
end
