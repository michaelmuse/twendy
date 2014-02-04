# ================================
# CREATES COUNTRIES AND ADDS WOEID
# ================================

Country.delete_all

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
  config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
  config.access_token        = ENV['TWITTER_ACCESS_TOKEN']
  config.access_token_secret = ENV['TWITTER_ACCESS_TOKEN_SECRET']
end

countries = []
country_data = client.trends_available
country_data.each do |x|
  countries.push(x[:attrs][:country])
end

countries.uniq!.sort!.slice!(0,1)

countries.each do |country|
  id = "Q6S.eLHV34GwNc79pswEdclgszSHyCyV7u5nb4kCEkfySEnahkUqyCEN1W1o2LsXR40GWpY"
  url_country = country.gsub(" ", "%20")
  pull = HTTParty.get("http://where.yahooapis.com/v1/places.q(#{url_country})?appid=#{id}")
  woeid = pull["places"]["place"]["woeid"]
  puts "======================"
  puts "#{country} // #{woeid}"
  puts "======================"
  Country.create(name: country, woeid: woeid)
end

