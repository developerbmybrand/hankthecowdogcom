require 'spec_helper'

describe "newletters/edit.html.erb" do
  before(:each) do
    @newletter = assign(:newletter, stub_model(Newletter))
  end

  it "renders the edit newletter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => newletters_path(@newletter), :method => "post" do
    end
  end
end
