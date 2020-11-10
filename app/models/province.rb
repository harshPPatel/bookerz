class Province < ApplicationRecord
  has_many :addresses, dependent: :nullify
end
