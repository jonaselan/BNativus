require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { create(:comment) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:posting) }
  end
end
