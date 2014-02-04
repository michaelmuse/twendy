class Country < ActiveRecord::Base
  attr_accessible :name, :woeid
  has_many :trends, through: :countries_trends
  has_many :countries_trends

  before_create :set_trends_updated_to_now
    def set_trends_updated_to_now
      self.trends_updated = Time.now
    end

  def add_local_trend(trend, time)
        
  end

end
