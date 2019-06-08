class Post < ApplicationRecord
  MAX_TWEET_LENGTH = 280

  def tweetable?
    content.length <= MAX_TWEET_LENGTH
  end
end
