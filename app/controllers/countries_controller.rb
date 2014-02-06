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
		@country = Country.find_by_name(params[:name])
#Dont need the below anymore
		# time = showcountry.get_trends_times(1)
		# @trends = showcountry.get_cohort_of_trends(time)

#####STARTING JSON TREND HISTORY CREATION####################################
    # step 1, get the LTEs for latest cohort
    latest_cohort_time = @country.get_latest_trends_timing
    latest_cohort_ltes = @country.get_latest_cohort_ltes(latest_cohort_time)

    ###################################################################
    # Make an array of latest cohort called @latest_trends_array
      #definition
      def makeLatestTrendsArray(latest_cohort_ltes)
        latest_trends_array = []
        latest_cohort_ltes.each do |lte|
          latest_trends_array.push(lte.trend)
          latest_trends_array.uniq!
        end
        return latest_trends_array
      end
      #call it
      @latest_trends_array = makeLatestTrendsArray(latest_cohort_ltes)

    ###################################################################
    # Make an array of current and historical LTEs for the current cohort called 
    # @curr_cohort_history_ltes
    #definition
    def makeCurrCohHistLtes(latest_trends_array)
      curr_cohort_history_ltes = []
      latest_trends_array.each do |trend|
        curr_cohort_history_ltes.push(LocalTrendingEvent.where(trend_id: trend.id, country_id: @country.id))
      end
      curr_cohort_history_ltes.flatten!.uniq!
      return curr_cohort_history_ltes
    end
    @curr_cohort_history_ltes = makeCurrCohHistLtes(@latest_trends_array)

    ###################################################################
    # Make an array called @all_intervals that holds all time elements across any 
    # LTE in the latest cohort
    @all_intervals = []
    @curr_cohort_history_ltes.each do |lte|
      @all_intervals.push(lte.time_of_trend)
    end
    @all_intervals.sort!.uniq!
    @all_intervals.reverse!

    # For each trend given an interval make an array of trend_name, trend_index, rank, time
    def makeCurrTrendsLines(interval)
      curr_interval_ltes = []
      @curr_cohort_history_ltes.each do |lte| 
        if lte.time_of_trend == interval
          curr_interval_ltes << lte
        end
      end
      curr_interval_ltes.uniq!
        puts "=======CURR LTES ARE:========"
        puts "#{curr_interval_ltes}"
      curr_trend_lines = []
      @latest_trends_array.each do |trend|
        puts "=======new trend========"
        #start writing a line for json
        line = {interval: interval}
        #look up LTE for trend at this interval
        lte_for_curr_trend_at_this_interval = []
        curr_interval_ltes.each do |lte|
          if lte.trend_id == trend.id
            lte_for_curr_trend_at_this_interval << lte
          end
        end
        lte_for_curr_trend_at_this_interval.uniq!
        puts "=======LTE IS:========"
        puts "#{lte_for_curr_trend_at_this_interval}"
        #if the trend existed at this interval
        unless lte_for_curr_trend_at_this_interval == []
          line[:name] = trend.name
          index = []
          @latest_trends_array.each_with_index do |latesttrend, idx|
            if latesttrend.id == trend.id
              index << idx+1
            end
          end
          index.uniq!
          line[:trend] = index.first
          line[:rank] = lte_for_curr_trend_at_this_interval.first.rank
        #if the trend didnt exist at this interval
        else
          line[:name] = trend.name
          index = []
          @latest_trends_array.each_with_index do |latesttrend, idx|
            if latesttrend.id == trend.id
              index << idx+1
            end
          end
          line[:trend] = index.first
          line[:rank] = 0
        end
        curr_trend_lines << line
      end
      return curr_trend_lines
    end

    ###################################################################
    # Iterate all intervals, for each, have a list of ten trend lines
    @alllines = []
    @all_intervals.each do |interval|
      tenlines = makeCurrTrendsLines(interval)
      @alllines << tenlines
        puts "=======new interval========"
    end

####ENDING JSON TREND HISTORY CREATION####################################

		respond_to do |format|
      format.html
      format.json { render :json => @alllines.to_json }
    end
	end


end
