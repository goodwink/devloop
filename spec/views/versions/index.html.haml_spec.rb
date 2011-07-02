require 'spec_helper'

describe "versions/index.html.haml" do
  before(:each) do
    assign(:versions, [
      stub_model(Version,
        :name => "Name",
        :slug => "Slug"
      ),
      stub_model(Version,
        :name => "Name",
        :slug => "Slug"
      )
    ])
  end

  it "renders a list of versions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
  end
end
