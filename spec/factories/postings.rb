FactoryGirl.define do
  factory :posting do
    language
    user
    category
    title { Faker::Lorem.sentence(3, true) }
    content { Faker::Lorem.paragraph(2, false, 4) }
    # views 1

    factory :debate do
      type 'Debate'
    end

    factory :article do
      type 'Article'
    end
  end
end
