class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :quantity, :name, :preparation, :recipe_id

  validates :name,   :presence => true
end
