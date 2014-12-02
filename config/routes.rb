Rails.application.routes.draw do

  resources :posts

  get 'archives' => 'posts#archives'

  root 'posts#index'

end
