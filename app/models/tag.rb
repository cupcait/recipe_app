class Tag < ActiveRecord::Base
  has_many :relationships, :foreign_key => :recipe_id, :dependent => :destroy
  has_many :recipes, :through => :relationships
end
