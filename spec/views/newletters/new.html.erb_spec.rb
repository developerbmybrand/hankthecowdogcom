require 'spec_helper'

describe "newletters/new.html.erb" do
  before(:each) do
    assign(:newletter, stub_model(Newletter).as_new_record)
  end

  it "renders new newletter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => newletters_path, :method => "post" do
    end
  end
end
