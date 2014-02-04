require 'spec_helper'

describe Country do
  describe 'given two Countries saved to our DB' do
    before do
      @country_options1 = {name: 'Worldwide', woeid: 1}
      @country_options2 = {name: 'NotWorldwide', woeid: 2}
      @country1 = Country.create(@country_options1)
      @country2 = Country.create(@country_options2)
    end
    it 'should have the country saved and return the right values' do
      @countries = Country.all
      @countries.count.should == 2
      @countries.each do |country|
        country.name.should == @country_options1[:name]
        country.woeid.should == @country_options2[:woeid]
        end
    end
    describe 'If a trend is created for this country, the country will know about that trend' do
      before do
        @trend_options1 = {name: 'SuperBowl', twitter_url: 'http://twitter.com/search/?q=SuperBowl'}
        @trend_options2 = {name: 'SuperParty', twitter_url: 'http://twitter.com/search/?q=SuperParty'}
        @trend1 = Trend.create(@trend_options1)
        @trend2 = Trend.create(@trend_options2)
        @country1.add_local_trend(trend1, time)
        @country2.add_local_trend(trend2, time)
      end
      @countries = Country.all
      @trends = Trend.all
      @countries.trends.should == @trends
    end

  end
end
