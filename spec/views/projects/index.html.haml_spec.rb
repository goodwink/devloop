require 'spec_helper'

describe "projects/index.html.haml" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :name => "Name",
        :slug => "Slug",
        :description => "Description",
        :gitorious_repo => "Gitorious Repo",
        :errbit_project => "Errbit Project",
        :statusnet_topic => "Statusnet Topic",
        :jenkins_project => "Jenkins Project"
      ),
      stub_model(Project,
        :name => "Name",
        :slug => "Slug",
        :description => "Description",
        :gitorious_repo => "Gitorious Repo",
        :errbit_project => "Errbit Project",
        :statusnet_topic => "Statusnet Topic",
        :jenkins_project => "Jenkins Project"
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Gitorious Repo".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Errbit Project".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Statusnet Topic".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Jenkins Project".to_s, :count => 2
  end
end
