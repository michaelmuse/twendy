require 'spec_helper'

describe Trend do
  describe "given two worldwide trends saved to our DB" do
    before do
      @trend_options1 = {name: 'SuperBowl', twitter_url: 'http://twitter.com/search/?q=SuperBowl'}
      @trend_options2 = {name: 'SuperParty', twitter_url: 'http://twitter.com/search/?q=SuperParty'}
      @trend1 = Trend.create(@trend_options1)
      @trend2 = Trend.create(@trend_options1)
      @trend3 = Trend.create(name: "SuperParty", twitter_url: "http://twitter.com/search/?q=SuperParty")
    end
    it "should have the trend saved and return the right values" do
      trends = Trend.all
      trends.count.should == 2
      @trend_names_array = [@trend_options1[:name], @trend_options2[:name]]
      @trend_twitter_urls_array = [@trend_options1[:twitter_url], @trend_options2[:twitter_url]]
      trends.each do |trend|
        expect(@trend_names_array).to include trend.name
        expect(@trend_twitter_urls_array).to include trend.twitter_url
      end
    end
  end
end
