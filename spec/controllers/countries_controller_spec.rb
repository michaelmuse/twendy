require 'spec_helper'

describe CountriesController do
  before do
    @country = Country.create(name: "Worldwide", woeid: 1)
  end

  describe "when visiting index" do
    before do
      get :index
    end

    it "should render the index page" do
      expect(response).to render_template("index")
    end

    it "retrieves all tweets" do
      assigns(:countries).should == Country.all
    end
  end
end


