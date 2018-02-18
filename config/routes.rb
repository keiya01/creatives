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
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'
  post 'users/:id/destroy' => 'users#destroy'
  get 'users/:id' => 'users#show'
  get 'auth/:provider/callback' => 'users#create'

  get 'how_to_use' => 'home#how_to_use'
  post 'how_to_use' => 'home#new_user'
  get 'agreement' => 'home#agreement'
  root 'home#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
