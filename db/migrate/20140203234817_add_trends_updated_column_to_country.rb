class AddTrendsUpdatedColumnToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :trends_updated, :datetime 
  end
end
