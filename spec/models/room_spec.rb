require 'rails_helper'

RSpec.describe Room, type: :model do
  subject { create(:room) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:link) }
    it { is_expected.to validate_presence_of(:level) }
    it { is_expected.to validate_uniqueness_of(:link) }
    it 'created without user (creator)' do
      expect(build(:room_without_creator).valid?).to_not be true
    end
    it 'created without language' do
      expect(build(:room_without_language).valid?).to_not be true
    end
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:language) }
  end
end
