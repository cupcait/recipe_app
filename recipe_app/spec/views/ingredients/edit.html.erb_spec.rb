require 'spec_helper'

describe "ingredients/edit.html.erb" do
  before(:each) do
    @ingredient = assign(:ingredient, stub_model(Ingredient,
      :amount => "MyString",
      :unit => "MyString",
      :name => "MyString",
      :preparation => "MyString",
      :recipe_id => 1
    ))
  end

  it "renders the edit ingredient form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ingredients_path(@ingredient), :method => "post" do
      assert_select "input#ingredient_amount", :name => "ingredient[amount]"
      assert_select "input#ingredient_unit", :name => "ingredient[unit]"
      assert_select "input#ingredient_name", :name => "ingredient[name]"
      assert_select "input#ingredient_preparation", :name => "ingredient[preparation]"
      assert_select "input#ingredient_recipe_id", :name => "ingredient[recipe_id]"
    end
  end
end
