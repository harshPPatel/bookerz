class OrdersController < ApplicationController
  def create
    print("Hello World!")
    redirect_back fallback_location: root_path
  end
end
