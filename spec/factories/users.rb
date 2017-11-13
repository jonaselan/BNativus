FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    username { Faker::Name.first_name }
    password { Faker::Internet.password(6) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    gender 'M'
    # avatar 'link'
    age { Faker::Number.between(18, 60) }
    born_on { Faker::Date.birthday(18, 60) }
    bio { Faker::ChuckNorris.fact }
    country 'some_country'
    phone { Faker::PhoneNumber.subscriber_number(9) }
  end
end
