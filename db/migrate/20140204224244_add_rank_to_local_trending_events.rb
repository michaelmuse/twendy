class AddRankToLocalTrendingEvents < ActiveRecord::Migration
  def change
    add_column :local_trending_events, :rank, :integer
  end
end
