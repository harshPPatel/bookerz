class BookCategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @categories = BookCategory.includes(:books).page params[:page]
  end

  def show
    @category = BookCategory.includes(:books).find(params[:id])
  end
end
