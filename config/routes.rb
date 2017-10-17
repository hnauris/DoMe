Rails.application.routes.draw do
  root 'pages#home'
  resources :comments
  
  devise_for :users
  resources :groups do
    resources :followers
    collection do
      get :subscribe
      post :subscribe
      get :my
    end
    resources :posts do
      resources :comments
    end
  end
  

  resources :augstskolas
  resources :pages



  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
