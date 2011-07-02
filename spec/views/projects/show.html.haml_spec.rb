require 'spec_helper'

describe "projects/show.html.haml" do
  before(:each) do
    @project = assign(:project, stub_model(Project,
      :name => "Name",
      :slug => "Slug",
      :description => "Description",
      :gitorious_repo => "Gitorious Repo",
      :errbit_project => "Errbit Project",
      :statusnet_topic => "Statusnet Topic",
      :jenkins_project => "Jenkins Project"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Slug/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Gitorious Repo/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Errbit Project/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Statusnet Topic/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Jenkins Project/)
  end
end
