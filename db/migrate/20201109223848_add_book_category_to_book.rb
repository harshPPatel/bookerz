class AddBookCategoryToBook < ActiveRecord::Migration[6.0]
  def change
    add_reference :book_categories, :book, null: false, foreign_key: true
  end
end
