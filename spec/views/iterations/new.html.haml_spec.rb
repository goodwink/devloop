require 'spec_helper'

describe "iterations/new.html.haml" do
  before(:each) do
    assign(:iteration, stub_model(Iteration,
      :name => "MyString",
      :slug => "MyString"
    ).as_new_record)
  end

  it "renders new iteration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => iterations_path, :method => "post" do
      assert_select "input#iteration_name", :name => "iteration[name]"
      assert_select "input#iteration_slug", :name => "iteration[slug]"
    end
  end
end
