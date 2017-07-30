Rails.application.routes.draw do
  root 'pages#home'
  resources :comments
  resources :posts
  devise_for :users
  resources :groups do
    collection do
      get :subscribe
      post :subscribe
    end
  end

  resources :augstskolas
  resources :pages



  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
