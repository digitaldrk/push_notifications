Rails.application.routes.draw do
  resources :notify_users, only: %i[create]
  resources :dashboards, only: %i[index]
  resources :subscriptions, only: %i[create]
end
