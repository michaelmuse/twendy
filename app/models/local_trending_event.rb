class LocalTrendingEvent < ActiveRecord::Base
  attr_accessible :country_id, :trend_id
  belongs_to :country
  belongs_to :trend
end