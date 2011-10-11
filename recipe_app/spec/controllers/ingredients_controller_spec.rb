require 'spec_helper'

describe IngredientsController do

  before(:each) do
    @attr = { :amount => "1", :unit => "cup", :name => "flour", :instructions => "sifted" }
  end

  it "should create a new instance given valid attributes" do
    Ingredient.create!(@attr)
  end

  it "should require an amount" do
    no_amount_ingredient = Ingredient.new(@attr.merge(:amount => ""))
    no_amount_ingredient.should_not be_valid
  end

  it "should not require a unit" do
    no_unit_ingredient = Ingredient.new(@attr.merge(:unit => ""))
    no_unit_ingredient.should be_valid
  end

  it "should require a name" do
    no_name_ingredient = Ingredient.new(@attr.merge(:name => ""))
    no_name_ingredient.should_not be_valid
  end

  it "should not require preparation" do
    no_preparation_ingredient = Ingredient.new(@attr.merge(:preparation => ""))
    no_preparation_ingredient.should be_valid
  end

end
