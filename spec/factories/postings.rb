FactoryGirl.define do
  factory :posting do
    language
    user
    category
    title "MyString"
    content "MyString"
    views 1
  end
end
