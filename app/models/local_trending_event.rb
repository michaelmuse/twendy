class LocalTrendingEvent < ActiveRecord::Base
  attr_accessible :country_id, :trend_id, :rank, :time_of_trend
  belongs_to :country
  belongs_to :trend
end