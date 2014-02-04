//////// THIS SHIT AINT WORKIN!!!! -mike deal //////////


//GET COUNTRIES FROM DATABASE
function FetchAllCountries(){
  $.ajax({
    url: "/countries",
    type: "get",
    dataType: "json",
    success: function(data){
      var rails_array_of_countries = data;
      rails_array_of_countries.forEach(function(country){
        var country = new Country(country.name)
        var new_country_view = new CountryView(country);
      })
    }
  })
}


//COUNTRY MODEL
var Country = function(name){
  var self = this;
  this.name = name;
}

var CountryView = function(model){
  var self = this; 
  this.model = model;
  this.model.view = self;

  this.addEventListeners = function(){ 
    var $country_item = self.$element.find('.country_item');
    $country_item.on("click", function(e){
      e.preventDefault();


      console.log("You clicked "+$country_item.text)

    });
  };


  this.template = function(){
    var html_array = [
      "<div class='country_item'>",
        self.model.name,
      "</div>"
    ];
    return html_array.join("")
  };


  this.render = function(){
    this.$element = $( this.template() );
    $('#main').append(this.$element);
  };


  this.render();
  this.addEventListeners();


};


// var Trend = function(){
//   var self = this;
//   this.trend_name = trend_name
// }


// var TrendView = function(model){
//   var self = this;

//   this.model = model;
//   this.model.view = self;
//   }






$(function(){
  
  FetchAllCountries();

})