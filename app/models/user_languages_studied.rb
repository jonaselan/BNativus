class UserLanguagesStudied < ApplicationRecord
  belongs_to :user
  belongs_to :languages_studied, class_name: 'Language'
end
