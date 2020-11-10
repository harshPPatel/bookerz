require "faker"

if Rails.env.development?
  AdminUser.create!(email:                 "admin@example.com",
                    password:              "password",
                    password_confirmation: "password")
end

canadian_provinces = ["Alberta", "British Columbia", "Manitoba", "New Brunswick",
                      "Newfoundland and Labrador", "Nova Scotia", "Ontario", "Prince Edward Island",
                      "Quebec", "Saskatchewan"]

# Adding provinces to the database
canadian_provinces.each do |province|
  Province.create(name: province)
end

3.times do
  address = Address.create(first_line:  Faker::Address.street_address,
                           second_line: Faker::Address.secondary_address,
                           city:        Faker::Address.city,
                           zipcode:     "R2K1Z1")
  address.stores.create(name:        Faker::Company.name,
                        description: Faker::Lorem.sentence)
end

10.times do
  book_category = BookCategory.create(name:        Faker::Name.unique.name,
                                      description: Faker::Lorem.sentence)
  Store.all.each do |store|
    author = Author.create(first_name: Faker::Name.unique.first_name,
                           last_name:  Faker::Name.unique.last_name,
                           birth_year: Faker::Number.within(range: 1800..2010))
    book_category.books.create(name:        Faker::Name.unique.name,
                               description: Faker::Lorem.sentence,
                               store:       store,
                               author:      author)
  end
end
