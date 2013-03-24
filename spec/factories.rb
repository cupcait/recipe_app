require 'factory_girl'

FactoryGirl.define do

  factory :recipe do
    name         "Cupakes"
    source       "cupcait dot com"
    url          "www.cupcait.com"
    ingredient   create(:ingredient)
    instruction  create(:instruction)
  end

  factory :ingredient do #|ingredient, recipe|
    quantity "2"
    name "vanilla"
    association :recipe
  end

  factory :instruction do #|instruction, recipe|
    content "Mix together and bake."
    association :recipe
  end

end

