class Post < ApplicationRecord
  MAX_TWEET_LENGTH = 280

  acts_as_taggable

  scope :pending, -> { where(ready: false) }
  scope :ready, -> { where(ready: true) }
  scope :ready_for_twitter, -> { where(ready: true, tweetable: true, tweeted: false) }

  before_validation do
    self.tweetable = self.content.length <= MAX_TWEET_LENGTH
  end

  def self.search(query)
    if query
      Post.where("content LIKE ?", "%#{sanitize_sql_like(query)}%")
    else
      Post.all
    end
  end
end
