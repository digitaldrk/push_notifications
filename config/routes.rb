Rails.application.routes.draw do
  root 'dashboards#index'
  resources :notify_users, only: %i[create]
  resources :dashboards, only: %i[index]
  resources :subscriptions, only: %i[create]
end
