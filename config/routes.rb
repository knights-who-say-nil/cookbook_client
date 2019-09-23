Rails.application.routes.draw do
  namespace :client do
    get '/recipes' => 'recipes#index'
    get '/recipes/:id' => 'recipes#show'
  end
end
