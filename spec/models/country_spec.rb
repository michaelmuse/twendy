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
      @country_names_array = [@country_options1[:name], @country_options2[:name]]
      @country_woeids_array = [@country_options1[:woeid], @country_options2[:woeid]]
      @countries.each do |country|
        expect(@country_names_array).to include country.name
        expect(@country_woeids_array).to include country.woeid
      end
    end
    describe 'If trends are created for this country at different times' do
      before do
        @rank1 = 1
        @rank2 = 2
        @trend_options1 = {name: 'SuperBowl', twitter_url: 'http://twitter.com/search/?q=SuperBowl'}
        @trend_options2 = {name: 'SuperParty', twitter_url: 'http://twitter.com/search/?q=SuperParty'}
        @trend_options3 = {name: 'SuperGame', twitter_url: 'http://twitter.com/search/?q=SuperGame'}
        @trend1 = Trend.create(@trend_options1)
        @trend2 = Trend.create(@trend_options2)
        @trend3 = Trend.create(@trend_options3)
        @curr_time = Time.now
        @old_time = @curr_time - 500000
        @country1.add_local_trend(@trend1, @rank1, @curr_time)
        @country1.add_local_trend(@trend2, @rank2, @old_time)
        @country1.add_local_trend(@trend3, @rank2, @curr_time)
      end
      it 'the country will know about that trend' do
        @countries = Country.all
        @trends = Trend.all

        @country1.trends.should == @trends
      end
      it 'will have created a time in the LocalTrendingEvent objects' do
        @localtrendingevent1 = LocalTrendingEvent.all.first
        @localtrendingevent1.time_of_trend.should == @curr_time
      end
      it 'will know when its most recent cohort of trends were imported' do
        @country1.get_latest_trends_timing.should == @curr_time
      end
      it 'can request all the trends from its most recent cohort time object' do
        curr_trends_array = LocalTrendingEvent.where(time_of_trend: @curr_time)
        @country1.get_cohort_of_trends(@curr_time).should == curr_trends_array
      end
    end
  end
  describe 'given multiple countries in the database' do
    before do 
      @country_options1 = {name: 'Worldwide', woeid: 1}
      @country_options2 = {name: 'NotWorldwide', woeid: 2}
      @country1 = Country.create(@country_options1)
      @country2 = Country.create(@country_options2)
      @trend1 = Trend.create{name: "cranberries", twitter_url: "www.google.com"}
      @trend2 = Trend.create{name: "thistrendisshared", twitter_url: "www.google.com"}
      @joiner1 = LocalTrendingEvent.create(country_id: 1, trend_id: 1, rank: 5)
      @joiner2 = LocalTrendingEvent.create(country_id: 1, trend_id: 2 , rank: 3)
      @joiner3 = LocalTrendingEvent.create(country_id: 2, trend_id: 1, rank: 4)
      @joiner4 = LocalTrendingEvent.create(country_id: 2, trend_id: 1, rank: 3)
    it 'will know about other countries which share a selected trend'

    end
  end
end
