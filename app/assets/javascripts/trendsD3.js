var trendsD3_result = [
 {"interval":"1","trend":"1","rank":"1"},
 {"interval":"1","trend":"2","rank":"2"},
 {"interval":"1","trend":"3","rank":"3"},
 {"interval":"1","trend":"4","rank":"4"},
 {"interval":"1","trend":"5","rank":"5"},
 {"interval":"1","trend":"6","rank":"6"},
 {"interval":"1","trend":"7","rank":"7"},
 {"interval":"1","trend":"8","rank":"8"},
 {"interval":"1","trend":"9","rank":"9"},
 {"interval":"1","trend":"10","rank":"10"},
 {"interval":"1","trend":"1","rank":"1"},
 {"interval":"1","trend":"2","rank":"2"},
 {"interval":"1","trend":"3","rank":"3"},
 {"interval":"1","trend":"4","rank":"4"},
 {"interval":"1","trend":"5","rank":"5"},
 {"interval":"1","trend":"6","rank":"6"},
 {"interval":"1","trend":"7","rank":"7"},
 {"interval":"1","trend":"8","rank":"8"},
 {"interval":"1","trend":"9","rank":"9"},
 {"interval":"1","trend":"10","rank":"10"},
 {"interval":"2","trend":"1","rank":"1"},
 {"interval":"2","trend":"2","rank":"2"},
 {"interval":"2","trend":"3","rank":"3"},
 {"interval":"2","trend":"4","rank":"4"},
 {"interval":"2","trend":"5","rank":"5"},
 {"interval":"2","trend":"6","rank":"6"},
 {"interval":"2","trend":"7","rank":"7"},
 {"interval":"2","trend":"8","rank":"8"},
 {"interval":"2","trend":"9","rank":"9"},
 {"interval":"2","trend":"10","rank":"10"},
 {"interval":"3","trend":"1","rank":"1"},
 {"interval":"3","trend":"2","rank":"2"},
 {"interval":"3","trend":"3","rank":"3"},
 {"interval":"3","trend":"4","rank":"4"},
 {"interval":"3","trend":"5","rank":"5"},
 {"interval":"3","trend":"6","rank":"6"},
 {"interval":"3","trend":"7","rank":"7"},
 {"interval":"3","trend":"8","rank":"8"},
 {"interval":"3","trend":"9","rank":"9"},
 {"interval":"3","trend":"10","rank":"10"},
 {"interval":"4","trend":"1","rank":"1"},
 {"interval":"4","trend":"2","rank":"2"},
 {"interval":"4","trend":"3","rank":"3"},
 {"interval":"4","trend":"4","rank":"4"},
 {"interval":"4","trend":"5","rank":"5"},
 {"interval":"4","trend":"6","rank":"6"},
 {"interval":"4","trend":"7","rank":"7"},
 {"interval":"4","trend":"8","rank":"8"},
 {"interval":"4","trend":"9","rank":"9"},
 {"interval":"4","trend":"10","rank":"10"},
 {"interval":"5","trend":"1","rank":"1"},
 {"interval":"5","trend":"2","rank":"2"},
 {"interval":"5","trend":"3","rank":"3"},
 {"interval":"5","trend":"4","rank":"4"},
 {"interval":"5","trend":"5","rank":"5"},
 {"interval":"5","trend":"6","rank":"6"},
 {"interval":"5","trend":"7","rank":"7"},
 {"interval":"5","trend":"8","rank":"8"},
 {"interval":"5","trend":"9","rank":"9"},
 {"interval":"5","trend":"10","rank":"10"},
 {"interval":"6","trend":"1","rank":"1"},
 {"interval":"6","trend":"2","rank":"2"},
 {"interval":"6","trend":"3","rank":"3"},
 {"interval":"6","trend":"4","rank":"4"},
 {"interval":"6","trend":"5","rank":"5"},
 {"interval":"6","trend":"6","rank":"6"},
 {"interval":"6","trend":"7","rank":"7"},
 {"interval":"6","trend":"8","rank":"8"},
 {"interval":"6","trend":"9","rank":"9"},
 {"interval":"6","trend":"10","rank":"10"},
 {"interval":"7","trend":"1","rank":"1"},
 {"interval":"7","trend":"2","rank":"2"},
 {"interval":"7","trend":"3","rank":"3"},
 {"interval":"7","trend":"4","rank":"4"},
 {"interval":"7","trend":"5","rank":"5"},
 {"interval":"7","trend":"6","rank":"6"},
 {"interval":"7","trend":"7","rank":"7"},
 {"interval":"7","trend":"8","rank":"8"},
 {"interval":"7","trend":"9","rank":"9"},
 {"interval":"7","trend":"10","rank":"10"},
 {"interval":"8","trend":"1","rank":"1"},
 {"interval":"8","trend":"2","rank":"2"},
 {"interval":"8","trend":"3","rank":"3"},
 {"interval":"8","trend":"4","rank":"4"},
 {"interval":"8","trend":"5","rank":"5"},
 {"interval":"8","trend":"6","rank":"6"},
 {"interval":"8","trend":"7","rank":"7"},
 {"interval":"8","trend":"8","rank":"8"},
 {"interval":"8","trend":"9","rank":"9"},
 {"interval":"8","trend":"10","rank":"10"},
 {"interval":"9","trend":"1","rank":"1"},
 {"interval":"9","trend":"2","rank":"2"},
 {"interval":"9","trend":"3","rank":"3"},
 {"interval":"9","trend":"4","rank":"4"},
 {"interval":"9","trend":"5","rank":"5"},
 {"interval":"9","trend":"6","rank":"6"},
 {"interval":"9","trend":"7","rank":"7"},
 {"interval":"9","trend":"8","rank":"8"},
 {"interval":"9","trend":"9","rank":"9"},
 {"interval":"9","trend":"10","rank":"10"},
 {"interval":"10","trend":"1","rank":"1"},
 {"interval":"10","trend":"2","rank":"2"},
 {"interval":"10","trend":"3","rank":"3"},
 {"interval":"10","trend":"4","rank":"4"},
 {"interval":"10","trend":"5","rank":"5"},
 {"interval":"10","trend":"6","rank":"6"},
 {"interval":"10","trend":"7","rank":"7"},
 {"interval":"10","trend":"8","rank":"8"},
 {"interval":"10","trend":"9","rank":"9"},
 {"interval":"10","trend":"10","rank":"10"},
 {"interval":"11","trend":"1","rank":"1"},
 {"interval":"11","trend":"2","rank":"2"},
 {"interval":"11","trend":"3","rank":"3"},
 {"interval":"11","trend":"4","rank":"4"},
 {"interval":"11","trend":"5","rank":"5"},
 {"interval":"11","trend":"6","rank":"6"},
 {"interval":"11","trend":"7","rank":"7"},
 {"interval":"11","trend":"8","rank":"8"},
 {"interval":"11","trend":"9","rank":"9"},
 {"interval":"11","trend":"10","rank":"10"},
 {"interval":"12","trend":"1","rank":"1"},
 {"interval":"12","trend":"2","rank":"2"},
 {"interval":"12","trend":"3","rank":"3"},
 {"interval":"12","trend":"4","rank":"4"},
 {"interval":"12","trend":"5","rank":"5"},
 {"interval":"12","trend":"6","rank":"6"},
 {"interval":"12","trend":"7","rank":"7"},
 {"interval":"12","trend":"8","rank":"8"},
 {"interval":"12","trend":"9","rank":"9"},
 {"interval":"12","trend":"10","rank":"10"}
 ];
 
var 
    trendsD3_margin = { top: 50, right: 0, bottom: 100, left: 0 },
    trendsD3_width = 880 - trendsD3_margin.left - trendsD3_margin.right,
    trendsD3_height = 880 - trendsD3_margin.top - trendsD3_margin.bottom,
    trendsD3_buckets = 10,
    // trendsD3_colors = ["#ffffd9","#edf8b1","#c7e9b4","#7fcdbb","#41b6c4","#1d91c0","#225ea8","#253494","#081d58","red"], // alternatively colorbrewer.YlGnBu[9]
    // trendsD3_colors = ["hsla(56,55%,85%,.8)","#61c4b2","#77c79f","#89ca8c","#a8b778","#c0a265","#d38b52","#dc7840","#e56230","#ef4623"], // alternatively colorbrewer.YlGnBu[9]
trendsD3_colors = [ '#ef4623',
  '#e56230',
  '#dc7840',
  '#d38b52',
  '#c0a265',
  '#a8b778',
  '#89ca8c',
  '#77c79f',
  '#61c4b2',
  'hsla(56,55%,85%,.8)' ];
  trendsD3_intervals = ["Now", "-2 hours", "-4 hr", "-6 hr", "-10 hr", "-12 hr", "-14 hr", "-16 hr", "-18 hr", "-20 hr", "-22 hr", "-24 hr"],
    trendsD3_trends = ["t1", "t2", "t3", "t4", "t5", "t6", "t7", "t8", "t9", "t10"],
    trendsD3_gridSize = Math.floor(trendsD3_width / trendsD3_intervals.length),
    trendsD3_legendElementWidth = trendsD3_gridSize * 2;

function trendsD3(error, data) {

    data = trendsD3_result.shuffle();

    var d = data,
        margin = trendsD3_margin,
        width = trendsD3_width,
        height = trendsD3_height,
        buckets = trendsD3_buckets,
        colors = trendsD3_colors,
        intervals = trendsD3_intervals,
        trends = trendsD3_trends,
        gridSize = trendsD3_gridSize,
        legendElementWidth = trendsD3_legendElementWidth;

    console.log(data);

    var colorScale = d3.scale.quantile()
        .domain([0, buckets - 1, d3.max(data, function (d) { return d.rank; })])
        .range(colors);

    // build the chart
    var svg = d3.select("#chart").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    // build the trends
    var timeLabels = svg.selectAll(".trendLabel")
        .data(trends)
        .enter().append("text")
          .text(function (d) { return d; })
          .attr("x", 0)
          .attr("y", function (d, i) { return i * gridSize; })
          .style("text-anchor", "end")
          .attr("transform", "translate(-6," + gridSize / 1.5 + ")")
          .attr("class", function (d, i) { return ((i >= 0 && i <= 4) ? "trendLabel mono axis axis-worktime" : "trendLabel mono axis"); });

    // build the interval
    var dayLabels = svg.selectAll(".intervalLabel")
        .data(intervals)
        .enter().append("text")
          .text(function(d) { return d; })
          .attr("x", function(d, i) { return i * gridSize; })
          .attr("y", 0)
          .style("text-anchor", "middle")
          .attr("transform", "translate(" + gridSize / 2 + ", -6)")
          .attr("class", function(d, i) { return ((i >= 7 && i <= 16) ? "intervalLabel mono axis axis-workweek" : "intervalLabel mono axis"); });

    // combining everything
    var heatMap = svg.selectAll(".trend")
        .data(data)
        .enter().append("rect")
        .attr("x", function(d) { return (d.interval - 1) * gridSize; })
        .attr("y", function(d) { return (d.trend - 1) * gridSize; })
        .attr("rx", 4)
        .attr("ry", 4)
        .attr("class", "interval bordered")
        .attr("width", gridSize-2)
        .attr("height", gridSize-2);

    (d.rank == 0) ? heatMap.style("fill", 'orange') : heatMap.style("fill", colors[0]);

    heatMap.transition().duration(1400)
        .style("fill", function(d) { return colorScale(d.rank); });

    heatMap.append("title").text(function(d) { return d.rank; });
     
    // building the color legend   
    var legend = svg.selectAll(".legend")
        .data([0].concat(colorScale.quantiles()), function(d) { return d; })
        .enter().append("g")
        .attr("class", "legend");

    legend.append("rect")
      .attr("x", function(d, i) { return legendElementWidth * i; })
      .attr("y", height)
      .attr("width", legendElementWidth)
      .attr("height", gridSize / 2)
      .style("fill", function(d, i) { return colors[i]; });

    legend.append("text")
      .attr("class", "mono")
      .text(function(d, i) { return "rank ≥ " + Math.round(i); })
      .attr("x", function(d, i) { return legendElementWidth * i; })
      .attr("y", height + gridSize);
}
