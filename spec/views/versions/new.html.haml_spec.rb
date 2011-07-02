require 'spec_helper'

describe "versions/new.html.haml" do
  before(:each) do
    assign(:version, stub_model(Version,
      :name => "MyString",
      :slug => "MyString"
    ).as_new_record)
  end

  it "renders new version form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => versions_path, :method => "post" do
      assert_select "input#version_name", :name => "version[name]"
      assert_select "input#version_slug", :name => "version[slug]"
    end
  end
end
