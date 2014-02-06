class CountriesController < ApplicationController

	def index
		@countries = Country.all

	  respond_to do |format|
      format.html
      format.json { render :json => @countries.to_json }
    end
	end

	def show
		country = Country.find_by_name(params[:name])
		time = country.get_latest_trends_timing
		@trends = country.get_cohort_of_trends(time)

		respond_to do |format|
      format.html
      format.json { render :json => @trends.to_json }
    end
	end

end
