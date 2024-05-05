Rails.application.routes.draw do
  get 'home/index'
  devise_for :users
  root 'home#index'

  authenticate :user, -> (user) { user.doctor? } do
   get 'doctors/index', to: 'doctors#index', as: 'doctors_index'
  end

  authenticate :user, -> (user) { user.receptionist? } do
    get 'receptionists/index', to: 'receptionists#index', as: 'receptionists_index'
    resources :patients
    resources :appointments
  end
end