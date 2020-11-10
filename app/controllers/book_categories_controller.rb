class BookCategoriesController < ApplicationController
  def index
    @categories = BookCategory.includes(:books).page params[:page]
  end

  def show
    @categories = get_categories
    @category = BookCategory.includes(:books).find(params[:id])
  end
end
