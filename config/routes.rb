Rails.application.routes.draw do
  root 'home#index'
  resources :jobs
  get 'admin/elements', to: 'admin#elements'
  get 'admin', to: 'admin#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
