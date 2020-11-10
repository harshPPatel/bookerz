class ApplicationController < ActionController::Base
  def get_categories
    categories = BookCategory.all
    return categories
  end
end
