VideoApp::Application.routes.draw do

  get "videos" => 'videos#index', as: 'videos'
  get "videos/new" => 'videos#new', as: 'new_video'
  get "videos/:id" => 'videos#show', as: 'video'
  get "videos/:id/edit" => 'videos#edit', as: 'edit_video'
    
  post "videos" => "videos#create"

  put "videos/:id" => "videos#update"

  delete "videos/:id" => "videos#destroy"

      #I'm not using resources :videos and typing each route manually instead to refer to it as my 'rake routes'
  
end
