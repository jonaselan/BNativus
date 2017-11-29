require 'rails_helper'
require "cancan/matchers"

RSpec.describe Ability, type: :model do
  subject(:ability) { Ability.new(user) }
  let(:actions) { %i[show destroy edit] }
  let(:user) { nil }

  describe "abilities" do
    describe "User" do
      context "can only view, destroy and edit users which they own" do
        let(:user) { create(:user) }
        it { is_expected.not_to be_able_to(actions, User.new) }
      end
    end

    describe "Room" do
      context "can only show, destroy and edit rooms which they own" do
        let(:user) { create(:user) }
        let(:room) { create(:room, user) }

        it { is_expected.not_to be_able_to(actions, Room.new) }
      end
    end

    describe "Posting" do
      context "can only show, destroy and edit postings which they own" do
        let(:user) { create(:user) }
        let(:posting) { create(:posting, user) }

        it { is_expected.not_to be_able_to(actions, Posting.new) }
      end
    end
  end
end
