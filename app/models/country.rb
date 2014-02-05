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
    return LocalTrendingEvent.order("time_of_trend desc").limit(1).first.time_of_trend
  end

  def get_cohort_of_trends(time)
    return LocalTrendingEvent.where(time_of_trend: time)
  end

  def find_overlapping_countries(trend_id)
    # this method begins from a country's list of trends and finds all countries which share that trend, it could go in the Trend model.
    return Trend.find(trend_id).countries
  end

  def find_past_trends(trend_id)
    # this method allows the country to search its past to find repeating trends.
    return self.trends.where('trend_id = #{trend_id}')
  end
end
