class Address < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :province

  validates :first_line, :city, :zipcode, presence: true
end
