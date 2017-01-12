Rails.application.routes.draw do
  devise_for :users
  root "messages#index"
  resources :chat_groups
  resources :messages
end
