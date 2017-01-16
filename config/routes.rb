Rails.application.routes.draw do
  devise_for :users
  resources :chat_groups
  resources :messages
  root "chat_groups#index"
end
