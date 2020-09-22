Rails.application.routes.draw do
  root to:'books#top'
  
  get "books/top"=>"books#about"
  get  "books/about"=>"books#top"
  devise_for :users
  resources :books
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end