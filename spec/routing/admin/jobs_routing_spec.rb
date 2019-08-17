require "rails_helper"

RSpec.describe Admin::JobsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/admin/jobs").to route_to("admin/jobs#index")
    end

    it "routes to #new" do
      expect(:get => "/admin/jobs/new").to route_to("admin/jobs#new")
    end

    it "routes to #show" do
      expect(:get => "/admin/jobs/1").to route_to("admin/jobs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/admin/jobs/1/edit").to route_to("admin/jobs#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/admin/jobs").to route_to("admin/jobs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/jobs/1").to route_to("admin/jobs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/jobs/1").to route_to("admin/jobs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/jobs/1").to route_to("admin/jobs#destroy", :id => "1")
    end
  end
end
