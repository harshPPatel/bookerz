Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "pages#home"
  resources :addresses
  resources :book_categories
  resources :books
  resources :order_books
  resources :orders
  resources :stores

  get "/search" => "pages#search", as: "search_page"
  get "/cart" => "pages#cart", as: "cart_page"

  post "books/add_to_cart/:id", to: "books#add_to_cart", as: "add_to_cart"
  delete "books/remove_from_cart/:id", to: "books#remove_from_cart", as: "remove_from_cart"
  post "cart/update_book_in_cart/:id", to: "pages#update_book_in_cart", as: "update_book_in_cart"

end
