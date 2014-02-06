class CountriesController < ApplicationController

	def index
		@countries = Country.order("name ASC")

	  respond_to do |format|
      format.html
      format.json { render :json => @countries.to_json }
    end
	end

###wants interval, trend_index, rank, trend_name

	def show
		country = Country.find_by_name(params[:name])
		time = country.get_trends_times(1)
		@trends = country.get_cohort_of_trends(time)
##EDITING 
    @trends.each do |trend|
      array_attrs = country.find_past_attrs_for_trend(trend[:trend_id])
    end
#########
		respond_to do |format|
      format.html
      format.json { render :json => @trends.to_json }
    end
	end

end
