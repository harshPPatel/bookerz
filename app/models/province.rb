class Province < ApplicationRecord
  has_many :addresses, dependent: :nullify
  validates :name, :current_gst, presence: true
  validates :current_gst,
            numericality: { greater_than_or_equal_to: 0,
                            less_than_or_equal_to:    1 }
end
