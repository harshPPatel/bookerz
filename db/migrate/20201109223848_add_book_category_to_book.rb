class AddBookCategoryToBook < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :book_category, null: true, foreign_key: true
  end
end
