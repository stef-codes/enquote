Rails.application.routes.draw do
  root to: 'application#welcome'
  devise_for :users, :controllers => {registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
