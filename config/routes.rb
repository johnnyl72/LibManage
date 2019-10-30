Rails.application.routes.draw do
  devise_for :users
  resources :loans
  resources :book_items
  resources :books
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'management', to: 'pages#management'
  get 'pos', to: 'pages#pos'
  get 'news', to: 'pages#news'
  get 'purchasing', to: 'pages#purchasing'
  get 'user_status', to: 'pages#user_status' # Temp
  get 'search', to: 'search#search'
end
