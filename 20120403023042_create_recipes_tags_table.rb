class CreateRecipesTagsTable < ActiveRecord::Migration
  def self.up
    create_table :recipes_tags, :id => false do |t|
        t.references :recipe
        t.references :tag
    end
    add_index :recipes_tags, [:recipe_id, :tag_id]
    add_index :recipes_tags, [:tag_id, :recipe_id]
  end

  def self.down
    drop_table :recipes_tags
  end
end
