RecipeApp::Application.routes.draw do
  resources :tags

  resources :recipes
  resources :ingredients

  match '/new', :to => 'recipes#new'

  root :to => 'recipes#index'

end
