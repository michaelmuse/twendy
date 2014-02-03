require 'spec_helper'

describe CountriesController do
  before do
    @country = Country.create(name: "Worldwide", woeid: 1)
  end

  describe "when visiting index" do
    before do
      get :index
    end

    it "retrieves all tweets" do
      assigns(:data).keys.should == Country.all
    end
  end
end


