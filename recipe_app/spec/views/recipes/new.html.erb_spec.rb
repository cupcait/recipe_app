require 'spec_helper'

describe "recipes/new.html.erb" do
  before(:each) do
    assign(:recipe, stub_model(Recipe,
      :name => "MyString",
      :source => "MyString",
      :url => "MyString",
      :instructions => "MyText"
    ).as_new_record)
  end

  it "renders new recipe form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => recipes_path, :method => "post" do
      assert_select "input#recipe_name", :name => "recipe[name]"
      assert_select "input#recipe_source", :name => "recipe[source]"
      assert_select "input#recipe_url", :name => "recipe[url]"
      assert_select "textarea#recipe_instructions", :name => "recipe[instructions]"
    end
  end
end
