class Category < ApplicationRecord
  has_many :postings

  validates_presence_of :title
end
