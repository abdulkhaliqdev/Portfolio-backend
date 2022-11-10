Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index, :show]
      resources :projects, only: [:index, :show]
      resources :contacts, only: [:create]
      get 'users/index'
      get 'home/index'
    end
  end
end
