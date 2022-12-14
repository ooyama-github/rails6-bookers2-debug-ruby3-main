Rails.application.routes.draw do
  
  get 'relationships/create'
  get 'relationships/destroy'
  get 'book_comments/create'
  get 'book_comments/destroy'
  get 'favorites/create'
  get 'favorites/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root to: "homes#top"

  get "home/about"=>"homes#about"
  get "search" => "searches#search"
 

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update]
  resources :users, only: [:index,:show,:edit,:update]
  resources :books do
    resource :favorites , only: [:create , :destroy]
    resources:book_comments,only:[:create,:destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htm
end