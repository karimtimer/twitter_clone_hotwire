class Comment < ApplicationRecord
  belongs_to :tweet
  has_rich_text :content

  broadcasts_to :tweet
  # after_create_commit -> { broadcast_append_to tweet }
  # after_destroy_commit -> { broadcast_remove_to tweet }
  # after_update_commit -> { broadcast_replace_to tweet }
end
