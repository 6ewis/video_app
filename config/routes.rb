VideoApp::Application.routes.draw do

  # resources :carts
  get 'carts/:id' => 'carts#show', as: 'cart'
  delete 'carts/:id' => 'carts#destroy'

  # resources :line_items
  post 'line_items' => 'line_items#create'

  root to: 'store#index'
  get 'store' => 'store#index', as: 'store'

  get "videos" => 'videos#index', as: 'videos'
  get "videos/new" => 'videos#new', as: 'new_video'
  get "videos/:id" => 'videos#show', as: 'video'
  get "videos/:id/edit" => 'videos#edit', as: 'edit_video'   
  post "videos" => "videos#create"
  put "videos/:id" => "videos#update"
  delete "videos/:id" => "videos#destroy"

      #I'm not using resources :videos and typing each route manually instead to refer to it as my 'rake routes'
  
end
