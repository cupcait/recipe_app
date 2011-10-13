class Recipe < ActiveRecord::Base
  has_many :ingredients, :dependent => :destroy
  attr_accessible :name, :source, :url, :ingredients, :instructions

  accepts_nested_attributes_for :ingredients

  validates :name,         :presence => true
  validates :source,       :presence => true
  # require ingredients later:
  # validates :ingredients,  :presence => true
  validates :instructions, :presence => true


  def add_ingredient
    # Do I want build or new?
    self.ingredients.build
  end
end
