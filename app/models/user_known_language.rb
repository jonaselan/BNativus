class UserKnownLanguage < ApplicationRecord
  belongs_to :user
  belongs_to :known_languages, class_name: 'Language'
end
