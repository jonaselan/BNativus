require 'rails_helper'

RSpec.describe Language, type: :model do
  context 'is invalid when' do
    it 'create without name' do
      lang = build(:lang_without_name)
      lang.valid?
      expect(lang.errors[:name]).to include('can\'t be blank')
    end
    it 'create without shortcode' do
      lang = build(:lang_without_shortcode)
      lang.valid?
      expect(lang.errors[:shortcode]).to include('can\'t be blank')
    end
  end
end
