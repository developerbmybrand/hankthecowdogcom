require 'spec_helper'

describe "newletters/show.html.erb" do
  before(:each) do
    @newletter = assign(:newletter, stub_model(Newletter))
  end

  it "renders attributes in <p>" do
    render
  end
end
