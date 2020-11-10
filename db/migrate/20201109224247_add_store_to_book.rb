class AddStoreToBook < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :store, null: true, foreign_key: true
  end
end
