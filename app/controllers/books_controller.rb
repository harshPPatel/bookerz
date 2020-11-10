class BooksController < ApplicationController

  def index
    @books = Book.includes(:book_category).page params[:page]
  end

  def show
    @book = Book.includes(:book_category).find(params[:id])
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart][id] = 1 unless session[:cart].key?(id)
    # session[:cart] << {[id]: 1 } unless session[:cart].include?(id)
    # print("SESSION CART ID:" + id)
    redirect_back fallback_location: root_path
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_back fallback_location: root_path
  end
end
