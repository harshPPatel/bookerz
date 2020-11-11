class OrdersController < ApplicationController
  def create
    session_cart = session[:cart]
    address = Address.find(current_user.address_id)
    province = Province.find(address.province_id)
    order = Order.create(order_date:  DateTime.now,
                         current_pst: 0.05,
                         current_gst: province.current_gst,
                         user_id:     current_user.id)
    return unless order.save!

    @cart.each do |book|
      OrderBook.create(quantity:    session_cart[book.id.to_s].to_i,
                       order_price: book.price,
                       order_id:    order.id,
                       book_id:     book.id)
    end
    session.delete(:cart)
    redirect_to order_url(order)
  end

  def show
    @id = params[:id]
  end
end
