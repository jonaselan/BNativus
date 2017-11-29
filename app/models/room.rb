class Room < ApplicationRecord
  belongs_to :user
  belongs_to :language

  validates :link, :level, presence: true

  validates :link, uniqueness: true

  scope :includes_for_room, -> { includes(:language, :user) }
end
