Rails.application.routes.draw do
  resources :notifications
  get "auth/:provider/callback", to: "sessions#create"
  get "login", to: "sessions#new"
  get "logout", to: "sessions#destroy"
  get "dashboard", to: "notifications#index"
  get "message/:id", to: "notifications#message", as: :message

  root "notifications#index"
end
