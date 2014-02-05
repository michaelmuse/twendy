class Trend < ActiveRecord::Base
  attr_accessible :name, :twitter_url
  validates_uniqueness_of :name

  has_many :countries, through: :local_trend_events
  has_many :local_trend_events

  def fetch_by_trend(id)
  	lte_trends = LocalTrendingEvent.where("trend_id = #{id}")
    lte_trends.each do |lte_trend|
      Trend.find(lte_trend.trend_id)
  end



end
