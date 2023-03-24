Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/developers", to: "developers#index"
  get "/video_games", to: "video_games#index"
end

# 5 verbs: get, post, patch/put, delete
# Actions: index, show, new, update, create, destroy, edit
