class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :recipe_id
      t.integer :tag_id

      t.timestamps
    end
    add_index :relationships, :recipe_id
    add_index :relationships, :tag_id
    add_index :relationships, [:recipe_id, :tag_id], :unique => true
  end

  def self.down
    drop_table :relationships
  end
end
