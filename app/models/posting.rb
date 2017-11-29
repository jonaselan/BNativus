class Posting < ApplicationRecord
  belongs_to :language
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  acts_as_votable

  def to_param
    "#{id} #{title}".parameterize
  end
end
