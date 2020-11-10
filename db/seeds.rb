require "faker"
require "pp"

if Rails.env.development?
  AdminUser.create!(email:                 "admin@example.com",
                    password:              "password",
                    password_confirmation: "password")
end

canadian_provinces = ["Alberta", "British Columbia", "Manitoba", "New Brunswick",
                      "Newfoundland and Labrador", "Nova Scotia", "Ontario", "Prince Edward Island",
                      "Quebec", "Saskatchewan"]

book_categories = ["Fantasy", "Adventure", "Romance", "Contemporary",
                   "Dystopian", "Mystery", "Horror", "Thriller", "Paranormal",
                   "Historical fiction"]

# Adding provinces to the database
canadian_provinces.each do |province|
  Province.create(name: province)
end

5.times do
  Store.create(name:        Faker::Company.name,
               description: Faker::Lorem.sentence)
end

book_categories.each do |category|
  book_category = BookCategory.create(name:        category,
                                      description: Faker::Lorem.sentence)
  Store.all.each do |store|
    pp(store)
    author = Author.create(first_name: Faker::Name.unique.first_name,
                           last_name:  Faker::Name.unique.last_name,
                           birth_year: Faker::Number.within(range: 1800..2010))
    book_category.books.create(name:        Faker::Name.unique.name,
                               description: Faker::Lorem.sentence,
                               store_id:    store.id,
                               author:      author)
  end
end
