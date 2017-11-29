class Category < ApplicationRecord
  has_many :postings, dependent: :destroy

  validates :title, presence: true
end
