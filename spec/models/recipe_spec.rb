require 'spec_helper'

describe Recipe do

  before(:each) do
    # ingredient = FactoryGirl.create(:ingredient)
    # instruction = FactoryGirl.create(:instruction)
    @attr = { :name => "cupcakes", :source => "cupcait dot com", :url => "www.cupcait.com" }
      # :instructions => [instruction], :ingredients => [ingredient] }
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

  # TODO: re-add once relationships are sorted out.
  # it "should require instructions" do
  #   no_instructions_recipe = Recipe.new(@attr.merge(:instructions => ""))
  #   no_instructions_recipe.should_not be_valid
  # end

  it "should not require a url" do
    no_url_recipe = Recipe.new(@attr.merge(:url => ""))
    no_url_recipe.should be_valid
  end

  describe "ingredient associations" do

    before(:each) do
      @recipe = Recipe.create(@attr)
      @ing1 = create(:ingredient, :recipe => @recipe)
      @ing2 = create(:ingredient, :recipe => @recipe)
    end

    it "should have a ingredients attribute" do
      @recipe.should respond_to(:ingredients)
    end

    it "should have the right ingredients in the right order" do
      @recipe.ingredients.should == [@ing1, @ing2]
    end

    it "should destroy associated ingredients" do
      @recipe.destroy
      [@ing1, @ing2].each do |ingredient|
        Ingredient.find_by_id(ingredient.id).should be_nil
      end
    end

  end
end
