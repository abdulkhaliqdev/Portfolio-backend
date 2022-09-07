Rails.application.routes.draw do
  get 'home/index'
  resources :articles
  resources :projects
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
