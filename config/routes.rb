Rails.application.routes.draw do
  devise_for :users
  resources :chat_groups do
    resources :messages
  end
  root "chat_groups#index"
end
