class CreateIngredients < ActiveRecord::Migration
  def self.up
    create_table :ingredients do |t|
      t.string :amount
      t.string :unit
      t.string :name
      t.string :preparation
      t.integer :recipe_id

      t.timestamps
    end
    add_index :ingredients, :recipe_id
  end

  def self.down
    drop_table :ingredients
  end
end
