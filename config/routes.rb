Rails.application.routes.draw do
  resources :loans
  resources :book_items
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'management', to: 'pages#management'
  get 'pos', to: 'pages#pos'
  get 'news', to: 'pages#news'
  get 'purchasing', to: 'pages#purchasing'
  get 'user_status', to: 'pages#user_status' # Temp
end
