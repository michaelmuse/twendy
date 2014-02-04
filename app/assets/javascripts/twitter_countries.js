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
				console.dir(data);
				self.render(data);
			},
			error: function(data) {
				console.log("Failed to connect to the database");
			}
		});
	},
	render: function(data) {
		var $li = $('li');
		
	}
};

var countries = new Countries;

$(function() {
  countries.fetch();
});