class RemoveInstructionsFromRecipes < ActiveRecord::Migration
  def self.up
    remove_column :recipes, :instructions
  end

  def self.down
    add_column :recipes, :instructions, :text
  end
end
