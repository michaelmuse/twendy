class CountriesTrends < ActiveRecord::Base
  attr_accessible :country_id, :trend_id
  belongs_to :countries
  belongs_to :trends
end
