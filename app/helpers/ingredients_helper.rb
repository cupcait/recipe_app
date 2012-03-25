module IngredientsHelper

def add_ingredient(recipe, f)
  ing = recipe.ingredients.build
  page.insert_html :bottom, :partial => 'ingredients/experimental_form', :locals => {:f => f}
end
  end
