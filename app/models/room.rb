class Room < ApplicationRecord
  belongs_to :user
  belongs_to :language

  validates :link, :level, presence: true
end
