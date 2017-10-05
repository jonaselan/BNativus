class Language < ApplicationRecord
  has_many :rooms

  validates :name, :shortcode, presence: true
end
