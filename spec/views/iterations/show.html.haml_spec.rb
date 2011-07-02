require 'spec_helper'

describe "iterations/show.html.haml" do
  before(:each) do
    @iteration = assign(:iteration, stub_model(Iteration,
      :name => "Name",
      :slug => "Slug"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Slug/)
  end
end
