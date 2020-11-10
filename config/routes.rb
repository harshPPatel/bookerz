Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'pages#home'
  resources :addresses
  resources :book_categories
  resources :books
  resources :order_books
  resources :orders
  resources :stores

  get '/search' => 'pages#search', :as => 'search_page'

end
