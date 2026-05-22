require 'spec_helper'

describe "printouts/show.html.erb" do
  before(:each) do
    @printout = assign(:printout, stub_model(Printout,
      :printout_name => "Printout Name",
      :printout_description => "Printout Description",
      :printout_image => "Printout Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Printout Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Printout Description/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Printout Image/)
  end
end
