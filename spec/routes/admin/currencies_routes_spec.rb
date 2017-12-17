require "rails_helper"

RSpec.describe Admin::CurrenciesController, type: :routing do
  describe "Admin::CurrenciesController" do

    it "routes to #index" do
      expect(:get => "/admin/currencies").to route_to("admin/currencies#index")
    end

    it "routes to #show" do
      expect(:get => "/admin/currencies/1").not_to be_routable
    end

    it "routes to #new" do
      expect(:get => "/admin/currencies/new").to route_to("admin/currencies#new")
    end

    it "routes to #edit" do
      expect(:get => "/admin/currencies/1/edit").to route_to("admin/currencies#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/admin/currencies").to route_to("admin/currencies#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/admin/currencies/1").to route_to("admin/currencies#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/admin/currencies/1").to route_to("admin/currencies#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/admin/currencies/1").to route_to("admin/currencies#destroy", :id => "1")
    end

  end
end