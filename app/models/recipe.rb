class Recipe < ActiveRecord::Base
  has_many :ingredients,  :dependent => :destroy
  has_many :instructions, :dependent => :destroy
  has_and_belongs_to_many :tags

  attr_accessible :name, :source, :url, :ingredients_attributes, :instructions_attributes, :tag_ids, :rating

  accepts_nested_attributes_for :ingredients, :reject_if => lambda { |p| p.values.all?(&:blank?) }, :allow_destroy => true
  accepts_nested_attributes_for :instructions, :reject_if => lambda { |p| p.values.all?(&:blank?) }, :allow_destroy => true

  accepts_nested_attributes_for :tags

  validates :name,         :presence => true
  validates :source,       :presence => true
  # require ingredients later:
  validates :ingredients,  :presence => true
  validates :instructions, :presence => true

  validates_inclusion_of :rating, :in => 0..5

end
