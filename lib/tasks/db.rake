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



  desc "Generates all countries with Twitter"
  task :seed_countries => [:auth_twitter] do
    Country.delete_all
    countries = []
    country_data = @client.trends_available
    country_data.each do |x|
      countries.push(x[:attrs][:country])
    end


    countries.uniq!.sort!.slice!(0,1)

    countries.each do |country|
      sleep 1.0
      coords = Geocoder.search(country)[0].data["geometry"]["location"]
      location = @client.trends_closest({lat: coords["lat"], long: coords["lng"]})
      woeid = location[0].attrs[:woeid]
      puts woeid
      puts country
      Country.create(name: country, woeid: woeid)
    end
  end

    


  desc "Seed my trends table"
  task :seed_trends => [:auth_twitter] do

    def getTrends(woeid)
      trend_data = @client.trends(id = woeid, options = {})
      trend_data.attrs[:trends].each do |trend|
        t = Trend.new()
        t.name = trend[:name]        
        t.twitter_url = trend[:url]
        #NEED TO SAVE WHICH COUNTRY IT BELONGS TO
        t.save
      end
    end

    countries = Country.order("trends_updated DESC")
    current_batch = countries.pop(2)
    current_batch.each do |country|
      woeid = country.woeid
      getTrends(woeid)
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