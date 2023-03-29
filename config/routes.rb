Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/developers", to: "developers#index"
  get "/developers/new", to: "developers#new"
  post "/developers", to: "developers#create"
  get "/developers/:id/edit", to: "developers#edit"
  patch "/developers/:id", to: "developers#update"
  get "/developers/:id", to: "developers#show"
  get "/video_games", to: "video_games#index"
  get "/video_games/:id", to: "video_games#show"
  get "/developers/:id/video_games", to: "developer_video_games#index"
end
