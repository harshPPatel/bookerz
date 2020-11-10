class BooksController < ApplicationController
  def index
    @categories = get_categories
    @books = Book.includes(:book_category).page params[:page]
  end

  def show
    @categories = get_categories
    @book = Book.includes(:book_category).find(params[:id])
  end
end
