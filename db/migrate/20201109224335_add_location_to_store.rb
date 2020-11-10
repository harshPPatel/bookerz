class AddLocationToStore < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :store, null: true, foreign_key: true
  end
end
