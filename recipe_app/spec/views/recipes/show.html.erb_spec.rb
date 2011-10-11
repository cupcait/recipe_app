require 'spec_helper'

describe "recipes/show.html.erb" do
  before(:each) do
    @recipe = assign(:recipe, stub_model(Recipe,
      :name => "Name",
      :source => "Source",
      :url => "Url",
      :instructions => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Source/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
