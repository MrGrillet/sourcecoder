Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'home#index'
  resources :jobs
  post 'jobs/apply', to: 'jobs#apply'
  get 'admin/elements', to: 'admin#elements'
  get 'admin', to: 'admin#index'

  resources :user_jobs, only: [:create]
  resources :code_languages
  resources :companies
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
