Rails.application.routes.draw do
  # get 'carts/show'
  #
  # get 'carts/add'
  #
  # get 'carts/remove'

  resources :products, only: [:show, :index]
  resource :cart, only: [:show] do
    put 'add/:product_id', to: 'carts#add', as: :add_to
    put 'remove/:product_id', to: 'carts#remove', as: :remove_from
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users

  ActiveAdmin.routes(self)
  resources :profiles
end
