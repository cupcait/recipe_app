RecipeApp::Application.routes.draw do
  resources :recipes
  resources :ingredients

  match '/new', :to => 'recipes#new'

  root :to => 'recipes#index'

end
