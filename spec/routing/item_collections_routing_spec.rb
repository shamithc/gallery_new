require "spec_helper"

describe ItemCollectionsController do
  describe "routing" do

    it "routes to #index" do
      get("/item_collections").should route_to("item_collections#index")
    end

    it "routes to #new" do
      get("/item_collections/new").should route_to("item_collections#new")
    end

    it "routes to #show" do
      get("/item_collections/1").should route_to("item_collections#show", :id => "1")
    end

    it "routes to #edit" do
      get("/item_collections/1/edit").should route_to("item_collections#edit", :id => "1")
    end

    it "routes to #create" do
      post("/item_collections").should route_to("item_collections#create")
    end

    it "routes to #update" do
      put("/item_collections/1").should route_to("item_collections#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/item_collections/1").should route_to("item_collections#destroy", :id => "1")
    end

  end
end
