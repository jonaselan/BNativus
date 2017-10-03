FactoryGirl.define do
  factory :language do
    name "language_1"
    shortcode "pr-br"

    factory :lang_without_name do
      name nil
    end

    factory :lang_without_shortcode do
      shortcode nil
    end

  end
end
