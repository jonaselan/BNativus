class Posting < ApplicationRecord
  belongs_to :language
  belongs_to :user
  belongs_to :category
end
