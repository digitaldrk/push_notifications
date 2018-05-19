Rails.application.routes.draw do
  root 'dashboards#index'
  resources :notify_users, only: %i[create]
  resources :dashboards, only: %i[index]
  resources :subscriptions, only: %i[create index]
  resources :test_data, only: %i[create index]
end
