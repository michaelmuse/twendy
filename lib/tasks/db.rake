namespace :db do

  desc "Authenticate Twitter"
  task :auth_twitter => :environment do
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
      config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
    end
  end

  desc "Seed my trends table"
  task :seed_trends => [:auth_twitter] do

    def getTrends(woeid)
      #CHANGE TRENDS PLACE BACK
      trend_data = @client.trends_place(id = woeid, options = {})
      @trends = {}
      trend_data.attrs[:trends].each_with_index do |trend, index|
        trend_target = Trend.find_by_name(trend[:name]) || false
        if trend_target ##ERROR HANDLING FOR DUPLICATES
          @trends[(index+1).to_s.to_sym] = trend
        else
          t = Trend.new()
          t.name = trend[:name]        
          t.twitter_url = trend[:url]
          t.save
          @trends[(index+1).to_s.to_sym] = t
        end
      end
      return @trends
    end

    countries = Country.order("trends_updated DESC")
    current_batch = countries.pop(10)
    current_batch.each do |country|
      woeid = country.woeid
      trends = getTrends(woeid)
      #need to iterate over array of trends
      @curr_country = country
      if trends
        trends.each do |rank, trend|
          @curr_country.add_local_trend(trend, rank)
        end
      end
      country.trends_updated = Time.now
      country.save!
    end
    puts "Tweets collected"
    puts "Countries updated: #{current_batch}"
  end

  desc "clear the Trend table"
  task :clear_trend => :environment do
    Trend.delete_all
  end

  desc "clear the Countries table"
  task :clear_countries => :environment do
    Country.delete_all
  end


end