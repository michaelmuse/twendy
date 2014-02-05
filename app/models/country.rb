class Country < ActiveRecord::Base
  attr_accessible :name, :woeid
  has_many :trends, through: :local_trending_events
  has_many :local_trending_events

  before_create :set_trends_updated_to_now
    def set_trends_updated_to_now
      self.trends_updated = Time.now
    end

  def add_local_trend(trend, rank)
    lte = LocalTrendingEvent.new()
    lte.time_of_trend = Time.now
    lte.trend_id = trend.id
    lte.country_id = self.id
    lte.rank = rank
    lte.save
  end

end
