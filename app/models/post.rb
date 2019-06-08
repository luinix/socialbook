class Post < ApplicationRecord
  acts_as_taggable

  MAX_TWEET_LENGTH = 280

  def tweetable?
    content.length <= MAX_TWEET_LENGTH
  end
end
