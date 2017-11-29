class UserKnownLanguage < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :known_languages, class_name: 'Language'

  enum level: %i[begginer upper_begginer intermediate
                 upper_intermediate advanced upper_advanced
                 native]
end
