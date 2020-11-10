class ApplicationController < ActionController::Base
  def fetch_categories
    @categories = BookCategory.all
  end
end
