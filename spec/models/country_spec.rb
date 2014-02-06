require 'spec_helper'

describe Country do
  describe 'given two Countries saved to our DB...' do
    before do
      @country_options1 = {name: 'Worldwide', woeid: 1}
      @country_options2 = {name: 'NotWorldwide', woeid: 2}
      @worldwide = Country.create(@country_options1)
      @notWorldWide = Country.create(@country_options2)
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
    describe '...and if trends are created for this country at different times' do
      before do
        @rank4 = 4
        @rank5 = 5
        @trend_optionsA = {name: 'trend1', twitter_url: 'http://twitter.com/search/?q=trend1'}
        @trend_optionsB = {name: 'trend2', twitter_url: 'http://twitter.com/search/?q=trend2'}
        @trend_optionsC = {name: 'trend3', twitter_url: 'http://twitter.com/search/?q=trend3'}
        @trend1 = Trend.create(@trend_optionsA)
        @trend2 = Trend.create(@trend_optionsB)
        @trend3 = Trend.create(@trend_optionsC)
        @curr_time = Time.now
        @old_time = @curr_time - 500000
        @worldwide.add_local_trend(@trend1, @rank4, @curr_time)
        @worldwide.add_local_trend(@trend1, @rank4, @old_time)
        @worldwide.add_local_trend(@trend2, @rank5, @old_time)
        @worldwide.add_local_trend(@trend3, @rank5, @curr_time)
        @notWorldWide.add_local_trend(@trend1, @rank5, @curr_time)
      end
      it 'the country will know about that trend' do
        @countries = Country.all
        @trends = Trend.all

        @worldwide.trends.should include(@trends[0], @trends[1], @trends[2])
      end
      it 'will have created a time in the LocalTrendingEvent objects' do
        @localtrendingevent1 = LocalTrendingEvent.all.first
        @localtrendingevent1.time_of_trend.should == @curr_time
      end
      it 'will know when its most recent cohort of trends were imported' do
        @worldwide.get_latest_trends_timing.should == @curr_time
      end
      it 'can request all the trends from its most recent cohort time object' do
        curr_lte_array = LocalTrendingEvent.where(time_of_trend: @curr_time)
        cohort_of_trends_gotten = @worldwide.get_cohort_of_trends(@curr_time).first[:time_of_trend]
        expect(cohort_of_trends_gotten).to eq(curr_lte_array[0].time_of_trend)
      end
      it 'will know about other countries which share a selected trend' do
        @worldwide.find_overlapping_countries(@trend1.id).should include(@notWorldWide)
        @worldwide.find_overlapping_countries(@trend2.id).should_not include(@notWorldWide)
      end
      it 'will know attributes of the same trend historically' do
        old_lte = LocalTrendingEvent.where(trend_id: @trend1.id, time_of_trend: @old_time).first
        @worldwide.find_past_attrs_for_trend(@trend1.id).should include(old_lte)
      end
    end
  end
end
