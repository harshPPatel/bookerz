class AddLocationToStore < ActiveRecord::Migration[6.0]
  def change
    add_reference :locations, :store, null: false, foreign_key: true
  end
end
