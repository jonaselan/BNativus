require 'rails_helper'

RSpec.describe Posting, type: :model do
  subject { create(:posting) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:language) }
    it { is_expected.to belong_to(:category) }
  end
end
