class Trend < ActiveRecord::Base
  attr_accessible :name, :twitter_url

  has_many :countries, through: :local_trend_events
  has_many :local_trend_events


end
