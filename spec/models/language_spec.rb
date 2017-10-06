require 'rails_helper'

RSpec.describe Language, type: :model do
  subject { create(:language) }

  describe "associations" do
    it { is_expected.to have_many(:rooms) }
  end

  describe 'validations' do
    it  { is_expected.to validate_presence_of(:name) }
    it  { is_expected.to validate_presence_of(:shortcode) }
  end
end
