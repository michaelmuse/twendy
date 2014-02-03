# ================================
# CREATES COUNTRIES AND ADDS WOEID
# ================================

all_countries = HTTParty.get("http://where.yahooapis.com/v1/countries?appid=Q6S.eLHV34GwNc79pswEdclgszSHyCyV7u5nb4kCEkfySEnahkUqyCEN1W1o2LsXR40GWpY")
all_countries["places"]["place"].each do |hash|
  Country.create(name: hash["name"], woeid: hash["woeid"])
end

