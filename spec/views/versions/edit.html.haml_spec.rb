require 'spec_helper'

describe "versions/edit.html.haml" do
  before(:each) do
    @version = assign(:version, stub_model(Version,
      :name => "MyString",
      :slug => "MyString"
    ))
  end

  it "renders the edit version form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => versions_path(@version), :method => "post" do
      assert_select "input#version_name", :name => "version[name]"
      assert_select "input#version_slug", :name => "version[slug]"
    end
  end
end
