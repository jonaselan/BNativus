class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :posting
  validates :content, presence: true
end
