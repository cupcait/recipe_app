class AddRatingToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :rating, :integer
  end

  def self.down
    remove_column :recipes, :rating
  end
end
