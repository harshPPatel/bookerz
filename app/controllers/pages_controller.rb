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
