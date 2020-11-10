class AddProvinceToAdress < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :province, null: false, foreign_key: true
  end
end
