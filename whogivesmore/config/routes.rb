Rails.application.routes.draw do


  get 'mains/index'

  get 'mains/show'

  # get 'account_informations/index'

  # get 'account_informations/edit'

  # get 'account_informations/new'

  # get 'account_informations/show'

  # get 'donations/index'

  # get 'donations/new'

  # get 'donations/show'

  # get 'donations/edit'

  # get 'charties/index'

  # get 'charties/new'

  # get 'charties/show'

  # get 'charties/edit'

  # get 'competitions/index'

  # get 'competitions/show'

  # get 'competitions/edit'

  # get 'competitions/new'

  # get 'teams/index'

  # get 'teams/new'

  # get 'teams/show'

  # get 'teams/edit'

  # mount_devise_token_auth_for 'User', at: 'auth'
  
  # resources :users
  resources :teams
  resources :competitions
  resources :charties
  resources :donations
  resources :baskets

  # root 'home#index'
  resources :account_informations
  # devise_for :users

 devise_for :users, controllers: {
        sessions: 'users/sessions',       
        registrations: 'users/registrations',
        passwords: 'users/passwords'
      } 
# as:user do
# devise_for :users, skip: [:registrations]
# as :user do
#   # get 'signin', to: 'devise/sessions#new', as: :new_user_session
#   # post 'signin', to: 'devise/sessions#create', as: :user_session

#   get 'sign_up',to: 'devise/registrations#new' ,as: :new_user_registration
#   get 'users/:id/edit',to: 'devise/registrations#edit', as: :edit_user_registration
#  patch 'users/:id',to: 'devise/registrations#update', as: :update_user_registration
#  put 'users/:id',to: 'devise/registrations#update'
#  delete 'users/:id',to: 'devise/registrations#destroy', as: :destroy_user_registration

#   # match 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session, via: Devise.mappings[:user].sign_out_via
# end
      
# devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  #  namespace :users, :defaults => {:format => :json} do
  #   as :user do
  #     post   "/sign-in"       => "sessions#create"
  #     delete "/sign-out"      => "sessions#destroy"
  #   end
  # end
end
