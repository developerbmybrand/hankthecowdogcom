require 'spec_helper'

describe "newletters/index.html.erb" do
  before(:each) do
    assign(:newletters, [
      stub_model(Newletter),
      stub_model(Newletter)
    ])
  end

  it "renders a list of newletters" do
    render
  end
end
