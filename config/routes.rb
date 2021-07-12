Rails.application.routes.draw do
  mount ActionCable.server => '/cable'
  devise_for :users
  root 'homes#top'
  resources :users, only: [:index, :show, :edit, :update]
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :chat_rooms, only: [:create, :show]
end
