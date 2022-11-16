Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get 'homes/about' => 'homes#about', as: 'about'

  #ネストする
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    #resource単数形にすると、/:idがURLに含まれない
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
