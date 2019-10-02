Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users
  resources :users, only: %i[index show] do
    resources :likes, only: %i[index]
    member do
      get :following, :followers
     end
  end
  resources :relationships, only: %i[create destroy]
  resources :posts, only: %i[index new show create destroy search] do
    resources :likes, only:%i[create destroy]
    resources :comments, only: %i[create edit]
  end
end
