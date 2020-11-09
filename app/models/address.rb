class Address < ApplicationRecord
  has_many :stores
  has_many :users
  belongs_to :province
end
