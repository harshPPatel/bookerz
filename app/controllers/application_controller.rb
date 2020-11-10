class ApplicationController < ActionController::Base
  before_action :fetch_categories
  before_action :initialize_cart
  before_action :load_cart

  private

  def fetch_categories
    @categories = BookCategory.all
  end

  def initialize_cart
    session[:cart] ||= {}
  end

  def load_cart
    keys = []
    session[:cart].each do |key, _|
      keys.push key
    end
    @cart = Book.find(keys)
  end
end
