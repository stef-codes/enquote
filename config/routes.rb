Rails.application.routes.draw do

  get '/quotes/search', to: 'quotes#search', as: 'quotes_search'

  resources :quotes

  resources :books

  resources :books, only: [:show]  do
    # nested resource for quotes
    resources :quotes, only: [:new, :show]
  end






  root to: 'application#welcome'
  devise_for :users, :controllers => {registrations: 'registrations', omniauth_callbacks: 'callbacks' }
  devise_scope :user do 
    get 'login', to: 'devise/sessions#new'
    get 'signup', to: 'devise/registrations#new'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
