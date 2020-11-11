class Address < ApplicationRecord
  belongs_to :user, optional: true
  has_one :province, dependent: :nullify

  validates :first_line, :city, :zipcode, presence: true
end
