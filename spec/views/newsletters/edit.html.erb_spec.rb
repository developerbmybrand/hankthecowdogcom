require 'spec_helper'

describe "newsletters/edit.html.erb" do
  before(:each) do
    @newsletter = assign(:newsletter, stub_model(Newsletter,
      :newsletter_name => "MyString",
      :newsletter_path => "MyString"
    ))
  end

  it "renders the edit newsletter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => newsletters_path(@newsletter), :method => "post" do
      assert_select "input#newsletter_newsletter_name", :name => "newsletter[newsletter_name]"
      assert_select "input#newsletter_newsletter_path", :name => "newsletter[newsletter_path]"
    end
  end
end
