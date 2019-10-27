Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations'}
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
end
