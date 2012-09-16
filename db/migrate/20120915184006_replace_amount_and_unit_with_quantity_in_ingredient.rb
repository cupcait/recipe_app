class ReplaceAmountAndUnitWithQuantityInIngredient < ActiveRecord::Migration
  def self.up
    remove_column :ingredients, :amount
    remove_column :ingredients, :unit
    add_column :ingredients, :quantity, :string
  end

  def self.down
    add_column :ingredients, :amount, :string
    add_column :ingredients, :unit, :string
    remove_column :ingredients, :quantity
  end
end
