Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'home#index'
  resources :jobs
  get 'admin/elements', to: 'admin#elements'
  get 'admin', to: 'admin#index'

  resources :user_jobs, only: [:create]
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
