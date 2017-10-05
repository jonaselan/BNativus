FactoryGirl.define do
  factory :room do
    user
    language
    link "MyString"
    level "MyString"
    ip { Faker::Internet.ip_v4_address }

    factory :room_without_creator do
      user nil
    end

    factory :room_without_language do
      language nil
    end
  end
end
