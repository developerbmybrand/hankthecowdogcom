require "spec_helper"

describe PrintoutsController do
  describe "routing" do

    it "routes to #index" do
      get("/printouts").should route_to("printouts#index")
    end

    it "routes to #new" do
      get("/printouts/new").should route_to("printouts#new")
    end

    it "routes to #show" do
      get("/printouts/1").should route_to("printouts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/printouts/1/edit").should route_to("printouts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/printouts").should route_to("printouts#create")
    end

    it "routes to #update" do
      put("/printouts/1").should route_to("printouts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/printouts/1").should route_to("printouts#destroy", :id => "1")
    end

  end
end
