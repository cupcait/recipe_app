RecipeApp::Application.routes.draw do
  resources :ingredients
  resources :recipes

  match '/new', :to => 'recipes#new'

  root :to => 'recipes#index'

end
