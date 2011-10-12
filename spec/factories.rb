Factory.define :recipe do |recipe|
  recipe.name         "Cupakes"
  recipe.source       "cupcait dot com"
  recipe.url          "www.cupcait.com"
  recipe.instructions "stir together, bake."
end

Factory.define :ingredient do |ingredient|
  ingredient.amount "2"
  ingredient.unit "tablespoons"
  ingredient.name "vanilla"
  ingredient.association :recipe
end

