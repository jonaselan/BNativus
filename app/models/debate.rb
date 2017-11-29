class Debate < Posting
  belongs_to :user, counter_cache: :created_debates
end
