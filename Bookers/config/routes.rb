Rails.application.routes.draw do
  root 'users#top'
  get "users/top"=>"books#index"
  devise_for :users
  resources :books,only: [:new, :create, :index, :show, :destory]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
