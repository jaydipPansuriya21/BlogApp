Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :comments
  end
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  
  get 'reset_password', to: 'passwords#edit'
  patch 'reset_password', to: 'passwords#update'

  delete 'sign_out', to: 'sessions#destroy'
end
