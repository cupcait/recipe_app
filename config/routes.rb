RecipeApp::Application.routes.draw do
  resources :comments
  resources :tags
  resources :recipes
  resources :ingredients
  resources :instructions

  match '/new', :to => 'recipes#new'

  root :to => 'recipes#index'

end
