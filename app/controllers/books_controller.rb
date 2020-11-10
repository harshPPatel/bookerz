class BooksController < ApplicationController
  before_action :initialize_cart
  before_action :load_cart
  before_action :fetch_categories

  def index
    @books = Book.includes(:book_category).page params[:page]
  end

  def show
    @book = Book.includes(:book_category).find(params[:id])
  end

  def add_to_cart
    id = params[:id].to_i
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to :back
  end

  # def add_to_cart
  #   id = params[:id].to_i
  #   session[:cart] << id unless session[:cart].include?(id)
  #   redirect_to :back
  # end

  private

  def initialize_cart
    session[:cart] ||= []
  end

  def load_cart
    @cart = Book.find(session[:cart])
  end
end
