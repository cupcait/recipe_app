class Recipe < ActiveRecord::Base
  has_many :ingredients, :dependent => :destroy
  has_many :relationships, :foreign_key => :tag_id, :dependent => :destroy
  has_many :tags, :through => :relationships

  attr_accessible :name, :source, :url, :ingredients_attributes, :instructions, :relationships

  accepts_nested_attributes_for :ingredients, :relationships

  validates :name,         :presence => true
  validates :source,       :presence => true
  # require ingredients later:
  # validates :ingredients,  :presence => true
  validates :instructions, :presence => true

  def tagged?(tag)
    relationships.find_by_tag_id(tag)
  end

  def tag!(tag)
    relationships.create!(:tag_id => tag.id)
  end

  def untag!(tag)
    relationships.find_by_tag_id(tag).destroy
  end

  def new_ingredient
    self.ingredients.build
  end

end
