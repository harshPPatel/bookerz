class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name, :unique => true, :null => false
      t.text :description

      t.timestamps
    end
  end
end
