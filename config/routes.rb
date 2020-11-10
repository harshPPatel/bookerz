Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'products#index'
  resources :addresses
  resources :book_categories
  resources :books
  resources :order_books
  resources :orders
  resources :stores
end
