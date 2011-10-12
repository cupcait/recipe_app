class Recipe < ActiveRecord::Base
  has_many :ingredients, :dependent => :destroy
  attr_accessible :name, :source, :url, :ingredients, :instructions

  accepts_nested_attributes_for :ingredients

  validates :name,         :presence => true
  validates :source,       :presence => true
#  validates :ingredients,  :presence => true
  validates :instructions, :presence => true

end
