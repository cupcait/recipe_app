class Instruction < ActiveRecord::Base
  belongs_to :recipe

  attr_accessible :content, :order, :recipe_id

  validates :content, :presence => true
end
