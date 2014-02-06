class Country < ActiveRecord::Base
  attr_accessible :name, :woeid
  has_many :trends, through: :local_trending_events
  has_many :local_trending_events

  before_create :set_trends_updated_to_now
  
  validates_uniqueness_of :name

  def set_trends_updated_to_now
    self.trends_updated = Time.now
  end

  def add_local_trend(trend, rank, time)
    lte = LocalTrendingEvent.new()
    lte.time_of_trend = time
    lte.trend_id = trend.id
    lte.country_id = self.id
    lte.rank = rank
    lte.save
  end

  def get_latest_trends_timing
    # Trolls the db looking for most recent trending events for the country upon which the method is called; returns the time of last seed.
    return LocalTrendingEvent.where(country_id: self.id).order("time_of_trend desc").limit(1).first.time_of_trend
  end

  def get_trends_times(selection)
    return_array = LocalTrendingEvent.where(country_id: self.id).order("time_of_trend desc")
    times_array = []
    return_array.each do |lte|
      data.push(lte.time_of_trend)
    end
    times_array.uniq!
    return times_array[0 .. selection.to_i]
  end

  def get_cohort_of_trends(time)
    return_array = LocalTrendingEvent.where(country_id: self.id, time_of_trend: time)
    data = []
    return_array.each do |lte|
      data.push({name: lte.trend.name, twitter_url: lte.trend.twitter_url, time_of_trend: lte.time_of_trend, rank: lte.rank})
    end
    return data
  end

  def find_overlapping_countries(trend_id)
    # this method begins from a country's list of trends and finds all countries which share that trend, it could go in the Trend model.
    return Trend.find(trend_id).countries
  end

  def find_past_attrs_for_trend(trend_id)
    # this method allows the country to search for past instances given a trend.
    return_array = LocalTrendingEvent.where(trend_id: trend_id, country_id: self.id)
    data = []
    return_array.each do |lte|
      data.push(lte)
    end
    return data
  end
end
