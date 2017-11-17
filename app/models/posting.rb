class Posting < ApplicationRecord
  belongs_to :language
  belongs_to :user
  belongs_to :category
  has_many :comments

  validates_presence_of :title
  validates_presence_of :content

  acts_as_votable

  def to_param
    "#{id} #{title}".parameterize
  end
end
