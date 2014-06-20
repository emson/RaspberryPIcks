require "spec_helper"

describe MainController do
  describe "routing" do

    it "routes to root should redirect to #new" do
      get("/").should route_to("main#index")
    end

  end
end
