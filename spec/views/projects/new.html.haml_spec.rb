require 'spec_helper'

describe "projects/new.html.haml" do
  before(:each) do
    assign(:project, stub_model(Project,
      :name => "MyString",
      :slug => "MyString",
      :description => "MyString",
      :gitorious_repo => "MyString",
      :errbit_project => "MyString",
      :statusnet_topic => "MyString",
      :jenkins_project => "MyString"
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_name", :name => "project[name]"
      assert_select "input#project_slug", :name => "project[slug]"
      assert_select "input#project_description", :name => "project[description]"
      assert_select "input#project_gitorious_repo", :name => "project[gitorious_repo]"
      assert_select "input#project_errbit_project", :name => "project[errbit_project]"
      assert_select "input#project_statusnet_topic", :name => "project[statusnet_topic]"
      assert_select "input#project_jenkins_project", :name => "project[jenkins_project]"
    end
  end
end
