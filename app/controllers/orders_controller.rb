class OrdersController < ApplicationController
  def create
    session_cart = session[:cart]
    @cart.each do |book|
      
    end
    redirect_back fallback_location: root_path
  end
end
