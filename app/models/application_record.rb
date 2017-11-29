class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :includes_for_postings, -> { includes(:language, :user, :category) }
  scope :desc_with_limit, ->(limit = 100) { order(created_at: :desc).limit(limit) }
end
