class Comment < ActiveRecord::Base
  belongs_to :recipe

  attr_accessible :content, :recipe_id

  validates :content, :presence => true
end
