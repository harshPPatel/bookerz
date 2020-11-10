require "faker"

if Rails.env.development?
  AdminUser.create!(email:                 "admin@example.com",
                    password:              "password",
                    password_confirmation: "password")
end

canadian_provinces = { "Alberta"                   => 0.05,
                       "British Columbia"          => 0.05,
                       "Manitoba"                  => 0.05,
                       "New Brunswick"             => 0.15,
                       "Newfoundland and Labrador" => 0.15,
                       "Nova Scotia"               => 0.15,
                       "Ontario"                   => 0.13,
                       "Prince Edward Island"      => 0.15,
                       "Quebec"                    => 0.05,
                       "Saskatchewan"              => 0.05,
                       "Northwest Territories"     => 0.05,
                       "Nunavut"                   => 0.05,
                       "Yukon"                     => 0.05 }

book_categories = ["Fantasy", "Adventure", "Romance", "Contemporary",
                   "Dystopian", "Mystery", "Horror", "Thriller", "Paranormal",
                   "Historical fiction"]

# Adding provinces to the database
canadian_provinces.each do |province, gst|
  Province.create(name: province, current_gst: gst)
end

5.times do
  Store.create(name:        Faker::Company.name,
               description: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false))
end

book_categories.each do |category|
  book_category = BookCategory.create(name:        category,
                                      description: Faker::Lorem
                                                          .paragraph_by_chars(number:       256,
                                                                              supplemental: false))
  Store.all.each do |store|
    author = Author.create(first_name: Faker::Name.unique.first_name,
                           last_name:  Faker::Name.unique.last_name,
                           birth_year: Faker::Number.within(range: 1800..2010))
    image_path = File.open(Rails.root.join("app/assets/images/author.png"))
    author.image.attach(io: image_path, filename: "author.png")

    book = book_category.books.create(name:        Faker::Name.unique.name,
                                      description: Faker::Lorem
                                                          .paragraph_by_chars(number:       256,
                                                                              supplemental: false),
                                      price:       Faker::Number.decimal(l_digits: 2),
                                      store_id:    store.id,
                                      author:      author)
    image_path = File.open(Rails.root.join("app/assets/images/book-cover.jpg"))
    book.image.attach(io: image_path, filename: "book-cover.jpg")
  end
end
