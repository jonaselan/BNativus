class UserLanguagesStudied < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :languages_studied, class_name: 'Language'

  enum level: %i[begginer upper_begginer intermediate
                 upper_intermediate advanced upper_advanced
                 native]
end
