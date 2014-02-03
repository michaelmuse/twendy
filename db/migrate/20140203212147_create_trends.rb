class CreateTrends < ActiveRecord::Migration
  def change
    create_table :trends do |t|
      t.string :name
      t.string :twitter_url

      t.timestamps
    end
  end
end
