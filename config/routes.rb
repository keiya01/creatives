Rails.application.routes.draw do

  get 'comments/:post_id/index' => 'comments#index'
  post 'comments/:post_id/create' => 'comments#create'

  post 'goods/:post_id/create' => 'goods#create'

  get 'rank' => 'posts#rank'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'
  get 'posts/index' => "posts#index"
  get 'posts/:id' => 'posts#show'

  post 'logout' => 'users#logout'
  get 'login' => 'users#login_form'
  post 'users/login' => 'users#login'
  get 'signup' => 'users#new'
  post 'users/create' => 'users#create'
  get 'users/:id' => 'users#show'

  get '/' => 'home#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
