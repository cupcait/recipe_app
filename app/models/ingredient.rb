class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :amount, :unit, :name, :preparation, :recipe_id

  #validates :amount, :presence => true
  #validates :name,   :presence => true
end
