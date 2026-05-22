require "spec_helper"

describe NewlettersController do
  describe "routing" do

    it "routes to #index" do
      get("/newletters").should route_to("newletters#index")
    end

    it "routes to #new" do
      get("/newletters/new").should route_to("newletters#new")
    end

    it "routes to #show" do
      get("/newletters/1").should route_to("newletters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/newletters/1/edit").should route_to("newletters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/newletters").should route_to("newletters#create")
    end

    it "routes to #update" do
      put("/newletters/1").should route_to("newletters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/newletters/1").should route_to("newletters#destroy", :id => "1")
    end

  end
end
