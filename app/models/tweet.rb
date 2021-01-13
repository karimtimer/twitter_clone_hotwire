class Tweet < ApplicationRecord
  after_create :set_like_and_retweet
  has_rich_text :content
  has_many :comments, dependent: :destroy

  broadcasts
  after_create_commit -> { broadcast_prepend_to "tweets" }
  after_destroy_commit -> { broadcast_remove_to "tweets" }
  after_update_commit -> { broadcast_replace_to "tweets" }

  validates :content, presence: true

  def set_like_and_retweet
    self.update(like_count: 0)
    self.update(retweet_count: 0)
  end
end
