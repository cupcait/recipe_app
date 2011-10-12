require 'spec_helper'

describe Ingredient do

  before(:each) do
    @recipe = Factory(:recipe)
    @attr = { :amount => "1", :unit => "cup", :name => "flour", :preparation => "sifted" }
  end

  it "should create a new instance given valid attributes" do
    @recipe.ingredients.create!(@attr)
  end

  it "should require an amount" do
    @recipe.ingredients.create(@attr.merge(:amount => "")).should_not be_valid
  end

  it "should not require a unit" do
    @recipe.ingredients.create(@attr.merge(:unit => "")).should be_valid
  end

  it "should require a name" do
    @recipe.ingredients.create(@attr.merge(:name => "")).should_not be_valid
  end

  it "should not require preparation" do
    @recipe.ingredients.create(@attr.merge(:preparation => "")).should be_valid
  end

  describe "recipe associations" do

    before(:each) do
      @ingredient = @recipe.ingredients.create(@attr)
    end

    it "should have a recipe attribute" do
      @ingredient.should respond_to(:recipe)
    end

    it "should have the right associated recipe" do
      @ingredient.recipe_id.should == @recipe.id
      @ingredient.recipe.should == @recipe
    end
  end


end
