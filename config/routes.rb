Rails.application.routes.draw do
  get 'common/header'
  get 'common/footer'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:new, :create, :index, :show, :top, :destroy, :edit, :update]
  resources :home do
  	collection do
  		get 'top'
  		get 'about'
  	end
  end
  resources :common
  root 'home#top'
  resources :users, only: [:index, :show, :edit, :update]
end
