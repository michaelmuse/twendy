class CountriesController < ApplicationController

	def index
		@countries = Country.all

	  respond_to do |format|
      format.html
      format.json { render :json => @countries.to_json }
    end
	end

	def show
		#@country = Country.find_by_name(params[:name])

		@trends = [
			{ :name => "What's up?!", :twitter_url => "http://www.google.com", :created_at => Time.now.getutc },
			{ :name => "What's up?!", :twitter_url => "http://www.google.com", :created_at => Time.now.getutc },
			{ :name => "What's up?!", :twitter_url => "http://www.google.com", :created_at => Time.now.getutc },
			{ :name => "What's up?!", :twitter_url => "http://www.google.com", :created_at => Time.now.getutc },
			{ :name => "What's up?!", :twitter_url => "http://www.google.com", :created_at => Time.now.getutc },
			{ :name => "What's up?!", :twitter_url => "http://www.google.com", :created_at => Time.now.getutc },
			{ :name => "What's up?!", :twitter_url => "http://www.google.com", :created_at => Time.now.getutc },
			{ :name => "What's up?!", :twitter_url => "http://www.google.com", :created_at => Time.now.getutc }
		]

		respond_to do |format|
      format.html
      format.json { render :json => @trends.to_json }
    end
	end

end
