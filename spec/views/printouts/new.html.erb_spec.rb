require 'spec_helper'

describe "printouts/new.html.erb" do
  before(:each) do
    assign(:printout, stub_model(Printout,
      :printout_name => "MyString",
      :printout_description => "MyString",
      :printout_image => "MyString"
    ).as_new_record)
  end

  it "renders new printout form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => printouts_path, :method => "post" do
      assert_select "input#printout_printout_name", :name => "printout[printout_name]"
      assert_select "input#printout_printout_description", :name => "printout[printout_description]"
      assert_select "input#printout_printout_image", :name => "printout[printout_image]"
    end
  end
end
