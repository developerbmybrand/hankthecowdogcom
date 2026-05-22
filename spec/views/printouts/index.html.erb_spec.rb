require 'spec_helper'

describe "printouts/index.html.erb" do
  before(:each) do
    assign(:printouts, [
      stub_model(Printout,
        :printout_name => "Printout Name",
        :printout_description => "Printout Description",
        :printout_image => "Printout Image"
      ),
      stub_model(Printout,
        :printout_name => "Printout Name",
        :printout_description => "Printout Description",
        :printout_image => "Printout Image"
      )
    ])
  end

  it "renders a list of printouts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Printout Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Printout Description".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Printout Image".to_s, :count => 2
  end
end
