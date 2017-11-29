class Language < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :user_known_languages, dependent: :destroy
  has_many :users, through: :user_known_languages
  has_many :user_languages_studieds, dependent: :destroy
  has_many :users, through: :user_languages_studieds
  has_many :postings, dependent: :destroy

  validates :name, :shortcode, presence: true
end
