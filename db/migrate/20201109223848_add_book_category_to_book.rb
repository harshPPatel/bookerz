class AddBookCategoryToBook < ActiveRecord::Migration[6.0]
  def change
    add_reference :book_categories, :book, null: true, foreign_key: true
  end
end
