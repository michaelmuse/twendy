
function Trend(name, twitter_url, time_of_trend, rank) {
	this.name = name;
	this.twitter_url = twitter_url;
	this.created_at = time_of_trend;
	this.rank = rank;
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
		var self = this;
		var $ul = $('<ul>').attr({'class': 'trends-list'});
		$.each(self.trends, function(index, trend) {
			var $li = $('<li>').attr({'class': 'trend'}).text(trend.name);
			$ul.append($li);
			$('ul#country-list').empty();
			$('#main').append($ul);
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
	fetch: function(success) {
		var self = this;
		$.ajax({
			method: "get",
			url: "/countries",
			dataType: "json",
			success: function(data) {
				$.each(data, function(index, country) {
					var new_country = new Country(country.name, country.woeid, country.trends_updated);
					self.add(new_country)
				});
				success();
			},
			error: function(data) {
				console.log("Failed to connect to the database.");
			}
		});
	}
}

function CountriesListView(){
	this.collection = new CountriesList;

	// bypassing lexical scope to seperate concerns
	var self = this;
	var success = function() {
		self.render();
		self.addHandlers();
	};

	this.collection.fetch(success);
}

CountriesListView.prototype = { 
		render: function() {
		var self = this;
		var $ul = $('ul#country-list');
		$.each(this.collection.countries, function(index, country) {
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
				url: "/countries/id",
				dataType: "json",
				data: { name: self.textContent },
				success: function(data) {
					console.dir(data);
					var trends_list = new TrendsList;
					$.each(data, function(index, trend) {
						var new_trend = new Trend(trend.name, trend.twitter_url, trend.time_of_trend, trend.rank);
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

$(function() {
  new CountriesListView;
});
