require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_uniqueness_of(:email) }
  end

  describe "associations" do
    it { is_expected.to have_many(:rooms) }
  end
end
