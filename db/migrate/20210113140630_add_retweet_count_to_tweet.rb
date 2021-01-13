class AddRetweetCountToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :retweet_count, :integer
  end
end
