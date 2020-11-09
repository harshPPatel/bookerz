class AddAuthorToBook < ActiveRecord::Migration[6.0]
  def change
    add_reference :authors, :book, null: false, foreign_key: true
  end
end
