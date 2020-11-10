class ProductsController < ApplicationController
  def index
    @categories = get_categories
  end
end
