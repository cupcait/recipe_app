class CreateRecipesTagsTable < ActiveRecord::Migration
  def self.up
    create_table :recipes_tags, :id => false do |t|
      t.integer :recipe_id
      t.integer :tag_id
    end
    add_index(:recipes_tags, [:recipe_id, :tag_id], :unique => true)
  end

  def self.down
    drop_table :recipes_tags
  end
end
