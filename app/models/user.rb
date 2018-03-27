class User < ApplicationRecord
  include Omniauthenticable
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: %i(google_oauth2 facebook)

  # mount_uploader :avatar, ImageUserUploader

  has_many :user_known_languages, dependent: :destroy
  has_many :known_languages, through: :user_known_languages, class_name: 'Language', foreign_key: 'known_languages_id'
  has_many :user_languages_studieds, dependent: :destroy
  has_many :languages_studied, through: :user_languages_studieds, class_name: 'Language', foreign_key: 'languages_studied_id'
  has_many :rooms, dependent: :destroy
  has_many :debates, dependent: :destroy
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :postings, dependent: :destroy

  validates :username, presence: true
  validates :username, :email, uniqueness: true

  accepts_nested_attributes_for :user_known_languages, allow_destroy: true
  accepts_nested_attributes_for :user_languages_studieds, allow_destroy: true

  enum gender: %i[M F]

  acts_as_voter

  # def self.from_omniauth(data)
  #   where(email: data['email']).first_or_create do |user|
  #     user.username = data.name.parameterize.underscore
  #     user.first_name = data.first_name
  #     user.last_name = data.last_name
  #     user.email = data.email
  #     user.password = Devise.friendly_token[0, 20]
  #     user.avatar = data.image
  #   end
  # end

  def to_param
    "#{id} #{username}".parameterize
  end
end
