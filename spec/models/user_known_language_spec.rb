require 'rails_helper'

RSpec.describe UserKnownLanguage, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:known_languages) }
  end
end
