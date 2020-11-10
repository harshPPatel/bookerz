class PagesController < ApplicationController
  def home
    @categories = BookCategory.includes(:books).all
  end

  def search
    @categories = get_categories
    params[:search].blank? && redirect_to(root_path) and return
    parameter = "%#{params[:search].downcase}%"
    @results = if params[:category].empty?
                 get_results(parameter, params)
               else
                 get_results_for_category(params[:category], parameter, params)
               end
  end

  def cart
    @total = @cart.reduce(0) do |accumulator, element|
      accumulator + (element.price * session[:cart][element.id.to_s].to_i)
    end
    @total_quantities = @cart.reduce(0) do |accumulator, element|
      accumulator + session[:cart][element.id.to_s].to_i
    end
  end

  def update_book_in_cart
    print("ID: " + params[:id])
    print("QUANTITY: " + params[:quantity])
    print("EXISTS: #{session[:cart].key?(params[:id])}")
    print("POSITIVE: #{params[:quantity].to_i.positive?}")
    id = params[:id].to_i
    quantity = params[:quantity].to_i
    session[:cart][id.to_s] = quantity if session[:cart].key?(id.to_s) && quantity.positive?
    redirect_back fallback_location: root_path
  end

  private

  def get_results(parameter, params)
    Book.includes(:book_category).all
        .where("( LOWER(name) LIKE :search ) OR ( LOWER(description) LIKE :search )",
               search: parameter)
        .page params[:page]
  end

  def get_results_for_category(id, parameter, params)
    Book.includes(:book_category).all
        .where(book_category_id: id)
        .where("( LOWER(name) LIKE :search ) OR ( LOWER(description) LIKE :search )",
               search: parameter)
        .page params[:page]
  end
end
