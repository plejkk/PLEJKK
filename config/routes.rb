Rails.application.routes.draw do
  devise_for :users
  root 'jokes#index'
  get 'home/top'
  resources :users, :only => [:index, :show, :edit, :update, :destroy]
  resources :jokes do
  	resource :favorites, only: [:create, :destroy]
  	resources :comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
