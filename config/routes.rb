Rails.application.routes.draw do
  root 'welcome#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/manifest.json', to: 'home#manifest'

  resources :patients
  get 'doctor/dashboard', to: 'doctors#dashboard'
  get 'receptionist/dashboard', to: 'receptionists#dashboard'
end
