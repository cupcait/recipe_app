require 'spec_helper'

describe "ingredients/show.html.erb" do
  before(:each) do
    @ingredient = assign(:ingredient, stub_model(Ingredient,
      :amount => "Amount",
      :unit => "Unit",
      :name => "Name",
      :preparation => "Preparation",
      :recipe_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Amount/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Unit/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Preparation/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
