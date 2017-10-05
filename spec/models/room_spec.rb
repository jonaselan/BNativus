require 'rails_helper'

RSpec.describe Room, type: :model do
  context 'is invalid when' do
    it 'created without user (creator)' do
      room = build(:room_without_creator)
      room.valid?
      expect(room.errors[:user]).to include('must exist')
    end
    it 'created without language' do
      room = build(:room_without_language)
      room.valid?
      expect(room.errors[:language]).to include('must exist')
    end
    it 'created without link' do
      room = build(:room, link: nil)
      room.valid?
      expect(room.errors[:link]).to include('can\'t be blank')
    end
    it 'created without level' do
      room = build(:room, level: nil)
      room.valid?
      expect(room.errors[:level]).to include('can\'t be blank')
    end
  end
end
