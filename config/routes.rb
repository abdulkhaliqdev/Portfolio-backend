Rails.application.routes.draw do
  resources :articles
  resources :projects
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
