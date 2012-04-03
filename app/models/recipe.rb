class Recipe < ActiveRecord::Base
  has_many :ingredients, :dependent => :destroy
  has_many :relationships, :foreign_key => :tag_id, :dependent => :destroy
  has_many :tags, :through => :relationships

  attr_accessible :name, :source, :url, :ingredients_attributes, :instructions, :tags #, :relationships_attributes

  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |p| p.values.all?(&:blank?) }, :allow_destroy => true
  #accepts_nested_attributes_for :relationships, :allow_destroy => true

  validates :name,         :presence => true
  validates :source,       :presence => true
  # require ingredients later:
  # validates :ingredients,  :presence => true
  validates :instructions, :presence => true

end
