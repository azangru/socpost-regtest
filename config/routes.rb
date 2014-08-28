TestRegistration::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    root :to => 'devise/registrations#new', as: :unauthenticated_root
    resources :users,  only: [:index]
    get '/users/check_login', to: 'users#check_login'
  end


end
