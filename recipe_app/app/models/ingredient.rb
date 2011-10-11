class Ingredient < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :amount, :unit, :name, :preparation

  validates :amount, :presence => true
  validates :name,   :presence => true
end
