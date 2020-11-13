ActiveAdmin.register OrderBook do
  permit_params :quantity, :order_price, :order_id, :book_id
end
