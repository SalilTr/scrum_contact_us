Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
resources :contacts do
  resources :replies
end


  root "contacts#index"
end
