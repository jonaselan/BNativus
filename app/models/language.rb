class Language < ApplicationRecord
  has_many :rooms
  has_many :user_known_languages
  has_many :users, through: :user_known_languages
  has_many :user_languages_studieds
  has_many :users, through: :user_languages_studieds
  has_many :postings

  validates :name, :shortcode, presence: true
end
