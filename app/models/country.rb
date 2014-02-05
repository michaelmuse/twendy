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

end
