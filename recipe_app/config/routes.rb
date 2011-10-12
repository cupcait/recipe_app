RecipeApp::Application.routes.draw do
  resources :recipes
  resources :ingredients, :only => [:create, :destroy]

  match '/new', :to => 'recipes#new'

  root :to => 'recipes#index'

end
