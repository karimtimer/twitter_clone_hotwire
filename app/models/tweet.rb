class Tweet < ApplicationRecord
  has_rich_text :content
  has_many :comments, dependent: :destroy

  broadcasts
  after_create_commit -> { broadcast_prepend_to "tweets" }
  after_destroy_commit -> { broadcast_remove_to "tweets" }
  after_update_commit -> { broadcast_replace_to "tweets" }

  validates :content, presence: true
end
