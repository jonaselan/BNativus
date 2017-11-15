require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { create(:category) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
  end

  describe "associations" do
    it { is_expected.to have_many(:postings) }
  end
end
