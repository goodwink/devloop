require 'spec_helper'

describe "profiles/index.html.haml" do
  before(:each) do
    assign(:profiles, [
      stub_model(Profile,
        :name => "Name",
        :description => "Description",
        :homepage => "Homepage",
        :statusnet => "Statusnet",
        :gitorious => "Gitorious"
      ),
      stub_model(Profile,
        :name => "Name",
        :description => "Description",
        :homepage => "Homepage",
        :statusnet => "Statusnet",
        :gitorious => "Gitorious"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Homepage".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Statusnet".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Gitorious".to_s, :count => 2
  end
end
