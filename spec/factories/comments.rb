FactoryGirl.define do
  factory :comment do
    content "MyText"
    user
    posting
  end
end
