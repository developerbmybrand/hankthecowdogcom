require 'spec_helper'

describe "newsletters/show.html.erb" do
  before(:each) do
    @newsletter = assign(:newsletter, stub_model(Newsletter,
      :newsletter_name => "Newsletter Name",
      :newsletter_path => "Newsletter Path"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Newsletter Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Newsletter Path/)
  end
end
