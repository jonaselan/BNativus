class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :posting
  validates_presence_of :content
end
