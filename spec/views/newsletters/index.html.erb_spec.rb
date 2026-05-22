require 'spec_helper'

describe "newsletters/index.html.erb" do
  before(:each) do
    assign(:newsletters, [
      stub_model(Newsletter,
        :newsletter_name => "Newsletter Name",
        :newsletter_path => "Newsletter Path"
      ),
      stub_model(Newsletter,
        :newsletter_name => "Newsletter Name",
        :newsletter_path => "Newsletter Path"
      )
    ])
  end

  it "renders a list of newsletters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Newsletter Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Newsletter Path".to_s, :count => 2
  end
end
