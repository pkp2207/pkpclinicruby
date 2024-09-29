Rails.application.routes.draw do
  root 'welcome#index'

  # Session management routes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  # Manifest file route
  get '/manifest.json', to: 'home#manifest'

  # User signup route
  get 'signup', to: 'users#new', as: 'new_user'

  # Patient resource routes (handles all CRUD actions)
  resources :patients

  # Receptionist routes
  scope controller: :receptionists do
    get 'receptionist/dashboard', action: :dashboard, as: :receptionist_dashboard
    get 'receptionist/new_patient', action: :new_patient, as: :new_patient_receptionists
    post 'receptionist/create_patient', action: :create_patient, as: :create_patient_receptionists
  end

  # Doctor routes
  get 'doctor/dashboard', to: 'doctors#dashboard'
end
