class CreateOrderBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :order_books do |t|
      t.integer :quantity, :default => 1
      t.decimal :order_price
      t.references :order, foreign_key: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
