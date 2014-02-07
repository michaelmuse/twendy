var countries_list = [];

// suffle any given array
function shuffle(arr) {
  for (var j, x, i = arr.length; i; j = Math.floor(Math.random() * i), x = arr[--i], arr[i] = arr[j], arr[j] = x);
  return arr;
};

function globus(error, world, names) {

	var auto_rotate = true;

	var width = height = 2000,
	    start = Date.now(),
	    title = d3.select("h1");

	var projection = d3.geo.orthographic()
	    .translate([width / 2, height / 2])
	    .precision(.95);

	var globe = {type: "Sphere"};
	var graticule = d3.geo.graticule();

	var canvas1 = d3.select("body").append("canvas"),
      canvas2 = d3.select("body").append("canvas").attr("class", "blur"), //drop shadow
      // canvas2 = d3.select("body").append("canvas").attr("class", "blur"), //drop shadow
      // canvas2 = d3.select("body").append("canvas").style('opacity', 0), //drop shadow
	    canvas3 = d3.select("body").append("canvas"),
	    canvasB = d3.select("body").append("canvas").on("click", function() {alert("CLICK");});;

	d3.selectAll("canvas").attr("width", width).attr("height", height);

	// getContext("2d") - built-in HTML5 object, with many properties and methods,
	// for drawing paths, boxes, circles, text, images, and more.
	var context1 = canvas1.node().getContext("2d"),
	    context2 = canvas2.node().getContext("2d"),
	    context3 = canvas3.node().getContext("2d"),
	    contextB = canvasB.node().getContext("2d");

	var path = d3.geo.path()
	    .projection(projection),
	    pathB = d3.geo.path()
	    .projection(projection)
	    .context(contextB);

	// background-color of the globe
	var grd = "white";
	grd = context1.createLinearGradient(0, 0, 760, 760);
	grd.addColorStop(0, "rgba(84,145,203,.3)");   
  // grd.addColorStop(1, "rgba(84,145,203,1)");
  // grd.addColorStop(1, "hsla(208,43%,80%,1)"); //water
	grd.addColorStop(1, "hsla(160,23%,80%,1)"); //water - teal

  projection.scale(width / 2.3).clipAngle(90);

  context1.beginPath();
  path.context(context1)(globe);
  context1.lineWidth = 1;
  context1.strokeStyle = "rgba(0,0,0,.5)"; // line around the globe
  context1.stroke();
  // context1.fillStyle = grd;  // filling globe color
  context1.fillStyle = grd;  // filling globe color
  context1.fill();

  // land shadow
  // context2.fillStyle = "rgba(0,0,0,.4)";
  context2.fillStyle = "rgba(0,0,0,.07)";

  // globe's cordinate lines
  context3.strokeStyle = "rgba(255,255,255,.5)";

  d3.json("world-110m.json", function(error, topo) {
    var land = topojson.feature(world, world.objects.land),
        countries = topojson.feature(world, world.objects.countries).features,
        borders = topojson.mesh(world, world.objects.countries, function(a, b) { return a !== b; }),
        i = -1,
        n = countries.length;

    countries = countries.filter(function(d) {
      return names.some(function(n) {
        if (d.id == n.id) return d.name = n.name;
      });
    }).sort(function(a, b) {
      return a.name.localeCompare(b.name);
    });

    // returning a countries names array
    all_countries = allCountries(countries);

    // click handle for a user input subbmition
    // var country;
    // document.getElementById("submit-search-country").onclick = function() {
		// 	var input = document.getElementById("country");
		// 	var index = all_countries.indexOf(input.value);
		// 	if (index > -1) {
		// 		country = assignCountryObject(countries, all_countries[index]);
		// 		auto_rotate = false;
		// 	}
		// 	input.value = "";
		// };

		// click handle for every country on the list
		var list = document.getElementsByTagName("li");
		for (var i=0; i < list.length; i++) {
			list[i].onclick = function(event) {
				var index = all_countries.indexOf(checkCountryName(event.target.innerHTML));
				if (index > -1) {
					country = assignCountryObject(countries, all_countries[index]);
					auto_rotate = false;
				}
			};
		}

    var grid = graticule();

    // suffle the countries array
    countries = shuffle(countries);

    // where the action taking place
    (function transition() {
	    d3.transition()
		  	.duration(1250)
		    .each("start", function() {
		      title.text(countries[i = (i + 1) % n].name);
		    })
		    .tween("rotate", function() {

		    	// rotate automatically only if set to true (and pick the next country)
          // pry country.all to make twitter array
          //if country(all) is in twitcountries(twitter only), keep looping the line below, if i gets above countries.length, go back to i=0
          var twitterCountriesArr = ["Argentina","Australia","Belgium","Brazil","Canada","Chile","Colombia","Dominican Republic","Ecuador","France","Germany","Greece","Guatemala","India","Indonesia","Ireland","Italy","Japan","Kenya","Korea","Malaysia","Mexico","Netherlands","New Zealand","Nigeria","Norway","Pakistan","Peru","Philippines","Poland","Portugal","Russia","Singapore","South Africa","Spain","Sweden","Turkey","Ukraine","United Arab Emirates","United Kingdom","United States","Venezuela"];
          var j = i - 1;
          do {
            (j < countries.length) ? j++ : j=0;
  		    	(auto_rotate) ? country = countries[j] : title.text(country.name);
          } while (twitterCountriesArr.indexOf(country.name) == -1)
          i = j;
		      var p = d3.geo.centroid(country),
		          r = d3.interpolate(projection.rotate(), [-p[0], -p[1]]);
		      
		      return function(t) {
		          projection.rotate(r(t));

		          context2.clearRect(0, 0, width, height);
		          context3.clearRect(0, 0, width, height);

		          projection.scale(width / 2.3).clipAngle(90);

		          context2.beginPath();
		          path.context(context2)(land);
		          context2.fill();

		          context3.beginPath();
		          path.context(context3)(grid);
		          context3.lineWidth = .5;
		          context3.stroke();

		          projection.scale(width / 2.2).clipAngle(106.3);

		          // land inner color
		          context3.beginPath();
		          path(land);
		          // context3.fillStyle = "#737368";
		          context3.fill();

		          projection.scale(width / 2.2).clipAngle(90);

		          // land color
		          context3.beginPath();
		          path(land);
		          context3.fillStyle = "hsla(56,55%,85%,1)";
		          context3.fill();

		          contextB.clearRect(0, 0, width, height);
		          // selected country
		          contextB.fillStyle = "hsla(15,95%,50%,1)", contextB.beginPath(), pathB(country), contextB.fill();
		          // country's borders
              // contextB.strokeStyle = "#fff", contextB.lineWidth = .5, contextB.beginPath(), pathB(borders), contextB.stroke();
		          contextB.strokeStyle = "#fff", contextB.lineWidth = .5, contextB.beginPath(), pathB(borders), contextB.stroke(); //country borders
					};
		    })
		  	.transition()
		    .each("end", transition);
		})();
  });
}

// returning countries name list based on counties objects
function allCountries(data) {
	var countries = [];
	for (var i=0; i < data.length; i++) {
		countries.push(data[i].name);
	}
	return countries;
}

// checking d3 countries name list match twitter list
function checkCountryName(country_name) {
	switch (country_name) {
		case "Korea, Democratic People's Republic of": country_name = "South Korea"; break;
		case "Russia": country_name = "Russian Federation"; break;
		case "Singapore": country_name = "Singapore"; break;
		case "Venezuela": country_name = "Venezuela, Bolivarian Republic of"; break;
	}
	return country_name;
}

// returnning a country object based on its name
function assignCountryObject(countries_object, country_name) {
	checkCountryName(country_name);
	for (var i=0; i < countries_object.length; i++) {
		if (countries_object[i].name == country_name)
			return countries_object[i];
	}
	return false;
}

// creating the countries list on the DOM 
function renderCountriesList() {
	var $ul = document.getElementById("countries"),
	    $li, index = 0;

	countries_list.forEach(function(country) {
		$li = document.createElement("li");
		$li.innerHTML = country;
		$ul.appendChild($li);
		index++;
	});
}

// will hold all countries names
var all_countries;

$(function() {
	var $page = document.getElementById("page"),
	    $element = document.createElement("div");
	$element.id = "globus";
	$element.className = "centered";
	$page.appendChild($element);

	queue()
	  .defer(d3.json, "world-110m.json")
	  .defer(d3.tsv, "world-country-names.tsv")
	  .await(globus);
});