
var countries_list = [];

function Country(name) {
	this.name = name;
}

function Countries() {
	this.twitter = [];
}
Countries.prototype = {
	create: function(name) {
		this.twitter.push(new Country(name));
	},
	fetch: function() {
		var self = this;
		$.ajax({
			method: "get",
			url: "/countries",
			dataType: "json",
			success: function(data) {
				self.render(data);
			},
			error: function(data) {
				console.log("Failed to connect to the database");
			}
		});
	},
	render: function(data) {
		var $ul = $('ul#country-list');
		$.each(data, function(index, country) {
			countries_list.push(country.name);
			var $li = $('<li>');
			$li.attr({'id': 'country'}).text(country.name);
			$ul.append($li);
		});
	}
};

var countries = new Countries;

$(function() {
  countries.fetch();
});