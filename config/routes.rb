Rails.application.routes.draw do
  root 'welcome#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/manifest.json', to: 'home#manifest'
  get 'signup', to: 'users#new', as: 'new_user'
  resources :users, only: [:new, :create]

  resources :patients do
    # Removed the separate edit route; it's handled by the resources block
    member do
      delete 'destroy', to: 'patients#destroy'  # Keep destroy route for DELETE
    end
  end
  
  # Receptionist routes
  scope controller: :receptionists do
    get 'receptionist/dashboard', action: :dashboard, as: :receptionist_dashboard
    get 'receptionist/new_patient', action: :new_patient, as: :new_patient_receptionists
    post 'receptionist/create_patient', action: :create_patient, as: :create_patient_receptionists
  end

  # Doctor routes
  get 'doctor/dashboard', to: 'doctors#dashboard'
end
