class AddLikeCountToTweet < ActiveRecord::Migration[6.0]
  def change
    add_column :tweets, :like_count, :integer
  end
end
