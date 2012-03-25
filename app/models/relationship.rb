class Relationship < ActiveRecord::Base
  attr_accessible :tag_id

  belongs_to :recipe
  belongs_to :tag

  validates :recipe, :presence => true
  validates :tag, :presence => true
end
