class Address < ApplicationRecord
  belongs_to :user, dependent: :delete
  has_one :province, dependent: :nullify

  validates :first_line, :city, :zipcode, presence: true
end
