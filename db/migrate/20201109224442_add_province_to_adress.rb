class AddProvinceToAdress < ActiveRecord::Migration[6.0]
  def change
    add_reference :provinces, :address, null: false, foreign_key: true
  end
end
