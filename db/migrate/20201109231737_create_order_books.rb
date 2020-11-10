class CreateOrderBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :order_books do |t|
      t.int :quantity, :default => 1
      t.decimal :order_price
      t.belongs_to :order
      t.belongs_to :book

      t.timestamps
    end
  end
end
