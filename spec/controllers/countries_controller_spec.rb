require 'spec_helper'

describe CountriesController do
  before do
    @country = Country.create(name: "country", woeid: 1)
    @country2 = Country.create(name: "country2", woeid: 2)
  end

  describe 'when visiting index' do
    before do
      get :index
    end

    it 'should render the index page' do
      expect(response).to render_template("index")
    end

    it 'retrieves all countries' do
      assigns(:countries).should == Country.all
    end

    it 'should display two countries' do
      expect(@country & @country2)
    end

    it 'should have a name' do
      expect @country.name = 'country'
    end

  end
end


