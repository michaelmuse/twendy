
var countries_list = [];

function Trend(name, twitter_url, created_at) {
	this.name = name;
	this.twitter_url = twitter_url;
	this.created_at = created_at;
}

function TrendsList() {
	this.trends = [];
}
TrendsList.prototype = {
	add: function(trend) {
		this.trends.push(trend);
	},
	fetch: function(country_name) {
		// COMPLETE FETCH
	},
	render: function() {
		var $ul = $('<ul>');
		$.each(this.trends, function(index, trend) {
			var $li = $('<li>').attr({'class', 'trend'}).text(trend.name);
			$ul.append($li);
		});
	}
}

function Country(name, woeid, trends_updated) {
	this.name = name;
	this.woeid = woeid;
	this.trends_updated = trends_updated;
}

function CountriesList() {
	this.countries = [];
}
CountriesList.prototype = {
	add: function(country) {
		this.countries.push(country);
	},
	fetch: function() {
		var self = this;
		$.ajax({
			method: "get",
			url: "/countries",
			dataType: "json",
			success: function(data) {
				$.each(data, function(index, country) {
					self.add(new Country(country.name, country.woeid, country.trends_updated))
				});
				self.render();
				self.addHandlers();
			},
			error: function(data) {
				console.log("Failed to connect to the database.");
			}
		});
	},
	render: function() {
		var self = this;
		var $ul = $('ul#country-list');
		$.each(this.countries, function(index, country) {
			var $li = $('<li>');
			$li.attr({'id': 'country'}).text(country.name);
			$ul.append($li);
		});
	},
	addHandlers: function() {
		$('li#country').on('click', function(event) {
			var self = this;
			$.ajax({
				method: "get",
				url: "/countries",
				dataType: "json",
				data: {country: self.textContent},
				success: function(data) {
					var trends_list = new TrendsList;
					$.each(data, function(index, trend) {
						var new_trend = new Trend(trend.name, trend.twitter_url, trend.created_at);
						trends_list.add(new_trend);
					});
					trends_list.render();
				},
				error: function(data) {
					console.log("Failed to connect to the database.");
				}
			});
		})
	}
}

var countries = new CountriesList;

$(function() {
  countries.fetch();
});