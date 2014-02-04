class Country < ActiveRecord::Base
  attr_accessible :name, :woeid

  before_create :set_trends_updated_to_now
    def set_trends_updated_to_now
      self.trends_updated = Time.now
    end

end
