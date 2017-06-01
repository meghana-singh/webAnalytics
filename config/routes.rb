Rails.application.routes.draw do
  
  resources :registered_applications , only: [:index, :show, :new, :create, :destroy]
  
  get 'welcome/index'
  get 'about' => 'welcome#about'

  devise_for :users
  
  root 'registered_applications#index'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
