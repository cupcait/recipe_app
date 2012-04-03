class Recipe < ActiveRecord::Base
  has_many :ingredients, :dependent => :destroy
  has_and_belongs_to_many :tags

  attr_accessible :name, :source, :url, :ingredients_attributes, :instructions, :tags

  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |p| p.values.all?(&:blank?) }, :allow_destroy => true

  validates :name,         :presence => true
  validates :source,       :presence => true
  # require ingredients later:
  # validates :ingredients,  :presence => true
  validates :instructions, :presence => true

end
