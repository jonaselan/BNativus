class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :rooms

  validates_presence_of :username
  validates_uniqueness_of :username, :email

  def self.from_omniauth(data)
    where(email: data['email']).first_or_create do |user|
      user.username = data.name.parameterize.underscore
      user.email = data.email
      user.password = Devise.friendly_token[0,20]
      # user.image = data.image
    end
  end
end
