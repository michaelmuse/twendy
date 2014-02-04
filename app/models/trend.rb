class Trend < ActiveRecord::Base
  attr_accessible :name, :twitter_url

  has_many :countries, through: :countries_trends
  has_many :countries_trends


end
