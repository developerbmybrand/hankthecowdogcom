require 'spec_helper'

describe "newsletters/new.html.erb" do
  before(:each) do
    assign(:newsletter, stub_model(Newsletter,
      :newsletter_name => "MyString",
      :newsletter_path => "MyString"
    ).as_new_record)
  end

  it "renders new newsletter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => newsletters_path, :method => "post" do
      assert_select "input#newsletter_newsletter_name", :name => "newsletter[newsletter_name]"
      assert_select "input#newsletter_newsletter_path", :name => "newsletter[newsletter_path]"
    end
  end
end
