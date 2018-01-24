Rails.application.routes.draw do

  post 'good/:post_id/create' => 'good#create'
  post 'bad/:post_id/create' => 'bad#create'

  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'
  get 'posts/index' => "posts#index"
  get 'posts/:id' => 'posts#show'

  get 'login' => 'users#login_form'
  post 'users/login' => 'users#login'
  get 'signup' => 'users#new'
  post 'users/create' => 'users#create'

  get '/' => 'home#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
