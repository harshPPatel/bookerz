class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.timestamp :order_date
      t.decimal :current_pst
      t.decimal :current_gst

      t.timestamps
    end
  end
end
