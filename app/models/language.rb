class Language < ApplicationRecord
  has_many :rooms
  has_many :user_known_languages
  has_many :users, through: :user_known_languages

  validates :name, :shortcode, presence: true
end
