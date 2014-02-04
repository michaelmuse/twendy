class CountriesController < ApplicationController

	def index
		@countries = Country.all

	  respond_to do |format|
      format.html
      format.json { render :json => @countries.to_json }
    end
	end

end
