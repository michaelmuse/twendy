class CreateLocalTrendingEvents < ActiveRecord::Migration
  def change
    create_table :local_trending_events do |t|
      t.integer :trend_id
      t.integer :country_id
      t.datetime :time_of_trend
      t.timestamps
    end
  end
end
