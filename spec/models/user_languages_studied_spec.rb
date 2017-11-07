require 'rails_helper'

RSpec.describe UserLanguagesStudied, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:languages_studied) }
  end
end
