class Trend < ActiveRecord::Base
  attr_accessible :name, :twitter_url
  validates_uniqueness_of :name

  has_many :countries, through: :local_trending_events
  has_many :local_trending_events

  def fetch_by_trend(id)
  	trends = LocalTrendingEvent.find_by_trend_id(id)
  	trends.each do |trend|
  		
  	end
  end

end
