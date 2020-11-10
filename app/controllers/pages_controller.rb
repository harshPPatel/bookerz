class PagesController < ApplicationController
  def home
    @categories = BookCategory.includes(:books).all
  end
end
