class Trend < ActiveRecord::Base
  attr_accessible :name, :twitter_url
  validates_uniqueness_of :name

  has_many :countries, through: :local_trend_events
  has_many :local_trend_events


end
