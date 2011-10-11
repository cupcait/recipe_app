class Recipe < ActiveRecord::Base
  has_many :ingredients
  attr_accessible :name, :source, :url, :ingredients, :instructions

  validates :name,         :presence => true
  validates :source,       :presence => true
#  validates :ingredients,  :presence => true
  validates :instructions, :presence => true

end
