class ZipcodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value =~ /^([A-Z]\d[A-Z]-?\d[A-Z]\d)/i

    record.errors[attribute] << (options[:message] || "is not valid postal code")
  end
end

class Address < ApplicationRecord
  has_many :stores, dependent: :nullify
  has_many :users, dependent: :nullify
  belongs_to :province

  validates :first_line, :city, :zipcode, presence: true
  validates :zipcode, zipcode: true
end
