class LocalTrendingEvent < ActiveRecord::Base
#join table - time_of_trend is the time the
  attr_accessible :country_id, :trend_id, :rank, :time_of_trend
  belongs_to :country
  belongs_to :trend

#############################################################

  def get_trend
    Trend.find(self.trend_id)
  end

#############################################################

end