require 'spec_helper'

describe RecipesController do
 before(:each) do
    @attr = { :name => "cupcakes", :source => "cupcait dot com", :url => "www.cupcait.com", :instructions => "combine ingredients, bake" }
  end

  it "should create a new instance given valid attributes" do
    Recipe.create!(@attr)
  end

  it "should require a name" do
    no_name_recipe = Recipe.new(@attr.merge(:name => ""))
    no_name_recipe.should_not be_valid
  end

  it "should require a source" do
    no_source_recipe = Recipe.new(@attr.merge(:source => ""))
    no_source_recipe.should_not be_valid
  end

  it "should require instructions" do
    no_instructions_recipe = Recipe.new(@attr.merge(:instructions => ""))
    no_instructions_recipe.should_not be_valid
  end

 it "should not require a url" do
    no_url_recipe = Recipe.new(@attr.merge(:url => ""))
    no_url_recipe.should be_valid
  end

end
