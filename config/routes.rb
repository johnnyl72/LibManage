Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    unlocks: 'users/unlocks' }

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

  get 'pos/pos', to: 'pos#pos'
  get 'pos/shelving', to: 'pos#shelving', as: 'shelving'
  get 'pos/returns', to: 'pos#returns', as: 'returns'
  get 'pos/checkout', to: 'pos#check_out', as: 'checkout'
  post 'pos/shelving', to: 'pos#shelving_submit'
  post 'pos/returns', to: 'pos#returns_submit'
  post 'pos/checkout', to: 'pos#check_out_submit'
end
