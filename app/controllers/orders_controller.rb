class OrdersController < ApplicationController
  def create
    session_cart = session[:cart]
    address = Address.find(current_user.address_id)
    province = Province.find(address.province_id)
    order = Order.create(order_date:  DateTime.now,
                         current_pst: province.current_pst,
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
    @order = Order.find(params[:id].to_i)
    @address = Address.find(current_user.address_id)
    sub_total = @order.order_books.reduce(0) do |accumulator, element|
      accumulator + (element.price * element.quantity)
    end
    total = sub_total * @address.current_gst * @address.current_pst
    @finance = { total:     total,
                 sub_total: sub_total,
                 gst:       @address.current_gst,
                 pst:       @address.current_pst }
  end

  def index
    @orders = Order.all.where(user_id: current_user.id).page params[:page]
  end
end
