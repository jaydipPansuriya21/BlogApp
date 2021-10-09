Rails.application.routes.draw do
  root "articles#index"
  resources :articles do
    resources :comments
  end
  get 'sign_up', to: 'registration#new'
  get 'sing_in', to: 'session#new'
  delete 'sign_out', to: 'session#destroy'
  get 'reset_password', to: 'passwords#edit'



end
