class Article < Posting
  belongs_to :user, counter_cache: :created_articles
end
