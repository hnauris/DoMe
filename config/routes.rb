Rails.application.routes.draw do

  get 'comments/index'

  get 'comments/show'

  get 'comments/new'

  get 'comments/edit'

  get 'posts/index'

  get 'posts/new'

  get 'posts/edit'

  get 'posts/show'

  devise_for :users
  root 'pages#home'

  get 'group/index'

  get 'group/new'

  get 'group/show'

  get 'group/edit'

  get 'augstskolas/index'

  get 'augstskolas/new'

  get 'augstskolas/show'

  get 'augstskolas/edit'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
