Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root 'home#index'
  resources :jobs
  post 'jobs/apply', to: 'jobs#apply'
  get 'admin/elements', to: 'admin#elements'
  get 'admin', to: 'admin#index'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  get 'faq', to: 'pages#faq'
  get 'pricing', to: 'pages#pricing'
  get 'privacy', to: 'pages#privacy'
  get 'terms', to: 'pages#terms'
  get 'hiring', to: 'pages#hiring'
  get 'applying', to: 'pages#applying'


  resources :user_jobs, only: [:create]
  resources :code_languages
  resources :companies
  resources :applications
  resources :profiles


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
