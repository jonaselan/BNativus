class Language < ApplicationRecord
  validates :name, :shortcode, presence: true
end
