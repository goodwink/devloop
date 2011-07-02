require 'spec_helper'

describe "profiles/edit.html.haml" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :name => "MyString",
      :description => "MyString",
      :homepage => "MyString",
      :statusnet => "MyString",
      :gitorious => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profiles_path(@profile), :method => "post" do
      assert_select "input#profile_name", :name => "profile[name]"
      assert_select "input#profile_description", :name => "profile[description]"
      assert_select "input#profile_homepage", :name => "profile[homepage]"
      assert_select "input#profile_statusnet", :name => "profile[statusnet]"
      assert_select "input#profile_gitorious", :name => "profile[gitorious]"
    end
  end
end
